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

    pub fn init(allocator: std.mem.Allocator, memory_size: usize) !CnPCompiler {
        return CnPCompiler{
            .allocator = allocator,
            .executor = try Executor.init(allocator, memory_size),
            .stencil_cache = try StencilCache.init(allocator),
        };
    }

    pub fn deinit(self: *CnPCompiler) void {
        self.stencil_cache.deinit();
        self.executor.deinit();
    }

    pub fn addPrologue(self: *CnPCompiler) !void {
        const prlg = [_]u8{ 0xFD, 0x7B, 0xBF, 0xA9, 0xFD, 0x03, 0x00, 0x91 };
        try self.executor.writeCode(&prlg);
    }

    pub fn compile(self: *CnPCompiler, expr: Expression) !*const fn (*Context) callconv(.c) i64 {
        self.executor.clear();

        std.debug.print("Expression: ", .{});
        expr.print();
        std.debug.print("\n", .{});

        try self.addPrologue();

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

        try self.emitOperation("pop_return");
        self.executor.printMemory();
        return try self.executor.getCodePointer(0, *const fn (*Context) callconv(.c) i64);
    }

    fn emitPushConst(self: *CnPCompiler, value: i64) !void {
        const stencil = try self.stencil_cache.get("push_const");
        try self.executor.writeCode(stencil.code);
        stencils.hole_slot = value; // patch value
    }

    fn emitOperation(self: *CnPCompiler, name: []const u8) !void {
        const stencil = try self.stencil_cache.get(name);
        try self.executor.writeCode(stencil.code);
        stencil.print();
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
        const stencil = try extractor.extractStencil(name, func_ptr, 256);
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

test "compile addition" {
    var compiler = try CnPCompiler.init(std.testing.allocator, 4096);
    defer compiler.deinit();

    const expr = try expression.Expression.parse(std.testing.allocator, "2 3 +");
    defer expr.deinit();

    const func = try compiler.compile(expr);

    std.debug.print("{p}\n", .{func});

    var ctx = Context.init();
    const result = func(&ctx);

    try std.testing.expectEqual(@as(i64, 5), result);
}
