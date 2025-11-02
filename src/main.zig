const std = @import("std");
const compiler = @import("compiler.zig");
const expression = @import("expression.zig");
const stencils = @import("stencils.zig");

const Context = stencils.Context;
const CnPCompiler = compiler.CnPCompiler;
const Expression = expression.Expression;

pub fn main() !void {
    var gpa = std.heap.GeneralPurposeAllocator(.{}){};
    defer _ = gpa.deinit();
    const allocator = gpa.allocator();

    var cnp = try CnPCompiler.init(allocator, 4096);
    defer cnp.deinit();

    const test_cases = [_]struct {
        expr: []const u8,
        expected: i64,
        description: []const u8,
    }{
        .{ .expr = "42", .expected = 42, .description = "Simple constant" },
        .{ .expr = "2 3 +", .expected = 5, .description = "Addition: 2 + 3" },
        .{ .expr = "10 5 -", .expected = 5, .description = "Subtraction: 10 - 5" },
        .{ .expr = "6 7 *", .expected = 42, .description = "Multiplication: 6 * 7" },
        .{ .expr = "20 4 /", .expected = 5, .description = "Division: 20 / 4" },
        .{ .expr = "2 3 + 4 *", .expected = 20, .description = "Complex: (2 + 3) * 4" },
        .{ .expr = "100 10 / 5 +", .expected = 15, .description = "Complex: 100 / 10 + 5" },
        .{ .expr = "5 neg", .expected = -5, .description = "Negation: -5" },
    };

    var passed: usize = 0;
    var failed: usize = 0;

    for (test_cases, 0..) |test_case, i| {
        std.debug.print("Test {}: {s}\n", .{ i + 1, test_case.description });

        const expr = try Expression.parse(allocator, test_case.expr);
        defer expr.deinit();

        const jit_func = try cnp.compile(expr);

        var ctx = Context.init();
        const result = jit_func(&ctx);

        if (result == test_case.expected) {
            std.debug.print("Result = {} (expected {})\n\n", .{ result, test_case.expected });
            passed += 1;
        } else {
            std.debug.print("FAIL: Result = {} (expected {})\n\n", .{ result, test_case.expected });
            failed += 1;
        }
    }
}
