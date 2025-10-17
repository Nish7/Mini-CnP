const std = @import("std");
const stack_stencils = @import("stack_stencils.zig");
const extractor = @import("extractor.zig");
const executor = @import("executor.zig");
const expression = @import("expression.zig");

const Context = stack_stencils.Context;
const Stencil = extractor.Stencil;
const Executor = executor.Executor;
const Expression = expression.Expression;
const OpType = expression.OpType;

pub const CnPCompiler = struct {
    allocator: std.mem.Allocator,
    executor: Executor,
    stencil_cache: StencilCache,
    current_offset: usize,

    pub fn init(allocator: std.mem.Allocator, memory_size: usize) !CnPCompiler {
        return CnPCompiler{
            .allocator = allocator,
            .executor = try Executor.init(allocator, memory_size),
            .stencil_cache = try StencilCache.init(allocator),
            .current_offset = 0,
        };
    }

    pub fn deinit(self: *CnPCompiler) void {
        self.stencil_cache.deinit();
        self.executor.deinit();
    }

    pub fn compile(self: *CnPCompiler, expr: Expression) !*const fn (*Context) callconv(.C) i64 {
        self.current_offset = 0;
        self.executor.clear();

        std.debug.print("Expression: ", .{});
        expr.print();
        std.debug.print("\n", .{});

        // For each operation, COPY its stencil
        for (expr.operations, 0..) |op, i| {
            std.debug.print("Step {}: ", .{i + 1});

            switch (op.op_type) {
                .load_const => {
                    std.debug.print("COPY push_const stencil, PATCH with {}\n", .{op.value.?});
                    try self.emitPushConst(op.value.?);
                },
                .add => {
                    std.debug.print("COPY add stencil\n", .{});
                    try self.emitOperation("add");
                },
                .sub => {
                    std.debug.print("COPY sub stencil\n", .{});
                    try self.emitOperation("sub");
                },
                .mul => {
                    std.debug.print("COPY mul stencil\n", .{});
                    try self.emitOperation("mul");
                },
                .div => {
                    std.debug.print("COPY div stencil\n", .{});
                    try self.emitOperation("div");
                },
                .neg => {
                    std.debug.print("COPY neg stencil\n", .{});
                    try self.emitOperation("neg");
                },
            }
        }

        std.debug.print("COPY pop_return stencil (with RET)\n", .{expr.operations.len + 1});
        try self.emitReturn();

        std.debug.print("\nGenerated {} bytes of chained machine code\n", .{self.current_offset});

        return self.executor.getCodePointer(0, *const fn (*Context) callconv(.C) i64);
    }

    /// Emit a push_const stencil with a patched value
    fn emitPushConst(self: *CnPCompiler, value: i64) !void {
        const stencil = try self.stencil_cache.get("push_const");
        const dest = self.executor.memory[self.current_offset..];

        // COPY the stencil (without RET)
        const size = stencil.size;
        @memcpy(dest[0..size], stencil.code[0..size]);

        // PATCH the magic constant
        try self.patchMagicConstant(self.current_offset, size, value);
        std.debug.print("Copied {} bytes, patched constant\n", .{size});

        self.current_offset += size;
    }

    /// Emit an operation stencil (add, sub, mul, div, neg)
    fn emitOperation(self: *CnPCompiler, name: []const u8) !void {
        const stencil = try self.stencil_cache.get(name);
        const dest = self.executor.memory[self.current_offset..];

        // COPY the stencil (without RET so it chains)
        var size = stencil.size;
        size = self.removeRetInstruction(stencil.code, size);

        @memcpy(dest[0..size], stencil.code[0..size]);
        std.debug.print("Copied {} bytes (RET removed for chaining)\n", .{size});

        self.current_offset += size;
    }

    /// Emit the final return stencil (keeps RET)
    fn emitReturn(self: *CnPCompiler) !void {
        const stencil = try self.stencil_cache.get("pop_return");
        const dest = self.executor.memory[self.current_offset..];

        // COPY with RET intact - this ends the chain
        @memcpy(dest[0..stencil.size], stencil.code[0..stencil.size]);
        std.debug.print("  → Copied {} bytes (RET kept - ends chain)\n", .{stencil.size});

        self.current_offset += stencil.size;
    }

    /// Remove RET instruction from code to enable chaining
    fn removeRetInstruction(self: *CnPCompiler, code: []const u8, size: usize) usize {
        _ = self;
        const arch = @import("builtin").cpu.arch;

        if (arch == .x86_64) {
            // Look for 'ret' (0xC3) at the end
            if (size > 0 and code[size - 1] == 0xC3) {
                return size - 1;
            }
            // Look for 'ret imm16' (0xC2)
            if (size > 2 and code[size - 3] == 0xC2) {
                return size - 3;
            }
        } else if (arch == .aarch64) {
            // ARM64 'ret' is 4 bytes: D6 5F 03 C0
            if (size >= 4 and
                code[size - 4] == 0xD6 and
                code[size - 3] == 0x5F and
                code[size - 2] == 0x03 and
                code[size - 1] == 0xC0)
            {
                return size - 4;
            }
        }

        return size; // Couldn't find RET, return original size
    }

    /// PATCH a magic constant value in the copied stencil
    fn patchMagicConstant(self: *CnPCompiler, offset: usize, size: usize, value: i64) !void {
        const code = self.executor.memory[offset..][0..size];
        const magic: i64 = 0x4242424242424242;

        var i: usize = 0;
        while (i + 8 <= size) : (i += 1) {
            if (i + 7 < size) {
                const ptr: *align(1) const i64 = @ptrCast(&code[i]);
                if (ptr.* == magic) {
                    const patch_ptr: *align(1) i64 = @ptrCast(&code[i]);
                    patch_ptr.* = value;
                    return;
                }
            }
        }

        std.debug.print("Could not find magic value to patch\n", .{});
        return error.MagicValueNotFound;
    }
};

/// Cache for extracted stencils
const StencilCache = struct {
    stencils: std.StringHashMap(Stencil),
    allocator: std.mem.Allocator,

    pub fn init(allocator: std.mem.Allocator) !StencilCache {
        var cache = StencilCache{
            .stencils = std.StringHashMap(Stencil).init(allocator),
            .allocator = allocator,
        };

        // Extract all stencils from our template functions
        try cache.extractAll();

        return cache;
    }

    pub fn deinit(self: *StencilCache) void {
        self.stencils.deinit();
    }

    fn extractAll(self: *StencilCache) !void {
        // Extract each stencil from the compiled template functions
        try self.extract("push_const", @ptrCast(&stack_stencils.push_const_stencil));
        try self.extract("add", @ptrCast(&stack_stencils.add_stencil));
        try self.extract("sub", @ptrCast(&stack_stencils.sub_stencil));
        try self.extract("mul", @ptrCast(&stack_stencils.mul_stencil));
        try self.extract("div", @ptrCast(&stack_stencils.div_stencil));
        try self.extract("neg", @ptrCast(&stack_stencils.neg_stencil));
        try self.extract("pop_return", @ptrCast(&stack_stencils.pop_return_stencil));
    }

    fn extract(self: *StencilCache, name: []const u8, func_ptr: *const anyopaque) !void {
        const stencil = try extractor.extractNamedStencil(name, func_ptr, 256);
        try self.stencils.put(name, stencil);
    }

    pub fn get(self: *StencilCache, name: []const u8) !Stencil {
        return self.stencils.get(name) orelse error.StencilNotFound;
    }

    pub fn printAll(self: *StencilCache) void {
        std.debug.print("\n=== Stencil Cache ===\n", .{});
        var iter = self.stencils.iterator();
        while (iter.next()) |entry| {
            entry.value_ptr.print();
        }
        std.debug.print("====================\n\n", .{});
    }
};

test "create compiler" {
    var compiler = try CnPCompiler.init(std.testing.allocator, 4096);
    defer compiler.deinit();

    try std.testing.expect(compiler.executor.memory.len >= 4096);
}

test "compile simple constant" {
    var compiler = try CnPCompiler.init(std.testing.allocator, 4096);
    defer compiler.deinit();

    const expr = try expression.Expression.parse(std.testing.allocator, "42");
    defer expr.deinit();

    const func = try compiler.compile(expr);

    var ctx = Context.init();
    const result = func(&ctx);

    try std.testing.expectEqual(@as(i64, 42), result);
}

test "compile addition" {
    var compiler = try CnPCompiler.init(std.testing.allocator, 4096);
    defer compiler.deinit();

    const expr = try expression.Expression.parse(std.testing.allocator, "2 3 +");
    defer expr.deinit();

    const func = try compiler.compile(expr);

    var ctx = Context.init();
    const result = func(&ctx);

    try std.testing.expectEqual(@as(i64, 5), result);
}

test "compile complex expression" {
    var compiler = try CnPCompiler.init(std.testing.allocator, 4096);
    defer compiler.deinit();

    // (2 + 3) * 4 = 20
    const expr = try expression.Expression.parse(std.testing.allocator, "2 3 + 4 *");
    defer expr.deinit();

    const func = try compiler.compile(expr);

    var ctx = Context.init();
    const result = func(&ctx);

    try std.testing.expectEqual(@as(i64, 20), result);
}

test "stencil cache" {
    var cache = try StencilCache.init(std.testing.allocator);
    defer cache.deinit();

    const add_stencil = try cache.get("add");
    try std.testing.expect(add_stencil.size > 0);

    const sub_stencil = try cache.get("sub");
    try std.testing.expect(sub_stencil.size > 0);
}
