const std = @import("std");
const stencils = @import("stencils.zig");
const extractor = @import("extractor.zig");
const executor = @import("executor.zig");
const expression = @import("expression.zig");

const Context = stencils.Context;
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

        try stencils.hole_slot
        std.debug.print("Copied {} bytes, patched constant\n", .{size});

        self.current_offset += size;
    }

    fn emitOperation(self: *CnPCompiler, name: []const u8) !void {
        const stencil = try self.stencil_cache.get(name);
        const dest = self.executor.memory[self.current_offset..];
        var size = stencil.size;
        size = self.removeRetInstruction(stencil.code, size);
        @memcpy(dest[0..size], stencil.code[0..size]);
        std.debug.print("Copied {} bytes (RET removed for chaining)\n", .{size});
        self.current_offset += size;
    }

    fn emitReturn(self: *CnPCompiler) !void {
        const stencil = try self.stencil_cache.get("pop_return");
        const dest = self.executor.memory[self.current_offset..];
        @memcpy(dest[0..stencil.size], stencil.code[0..stencil.size]);
        std.debug.print("  → Copied {} bytes (RET kept - ends chain)\n", .{stencil.size});
        self.current_offset += stencil.size;
    }

    fn removeRetInstruction(_: *CnPCompiler, code: []const u8, size: usize) usize {
        if (size >= 4 and
            code[size - 4] == 0xD6 and
            code[size - 3] == 0x5F and
            code[size - 2] == 0x03 and
            code[size - 1] == 0xC0)
        {
            return size - 4;
        }

        return size;
    }
};

const StencilCache = struct {
    stencils: std.StringHashMap(Stencil),
    allocator: std.mem.Allocator,

    pub fn init(allocator: std.mem.Allocator) !StencilCache {
        var cache = StencilCache{
            .stencils = std.StringHashMap(Stencil).init(allocator),
            .allocator = allocator,
        };

        try cache.extractAll();

        return cache;
    }

    pub fn deinit(self: *StencilCache) void {
        self.stencils.deinit();
    }

    fn extractAll(self: *StencilCache) !void {
        // Extract each stencil from the compiled template functions
        try self.extract("push_const", @ptrCast(&stencils.push_const_stencil));
        try self.extract("add", @ptrCast(&stencils.add_stencil));
        try self.extract("sub", @ptrCast(&stencils.sub_stencil));
        try self.extract("mul", @ptrCast(&stencils.mul_stencil));
        try self.extract("div", @ptrCast(&stencils.div_stencil));
        try self.extract("neg", @ptrCast(&stencils.neg_stencil));
        try self.extract("pop_return", @ptrCast(&stencils.pop_return_stencil));
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
