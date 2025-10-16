const std = @import("std");

pub const OpType = enum {
    add,
    sub,
    mul,
    div,
    load_const,
    neg,
};

/// A single operation in an expression
pub const Operation = struct {
    op_type: OpType,
    value: ?i64 = null, // For load_const operations
};

/// An expression is a sequence of operations in Reverse Polish Notation (RPN)
/// This makes it easy to compile without complex parsing
/// Example: "2 3 + 4 *" means (2 + 3) * 4 = 20
pub const Expression = struct {
    operations: []Operation,
    allocator: std.mem.Allocator,

    pub fn init(allocator: std.mem.Allocator, ops: []Operation) !Expression {
        const operations = try allocator.alloc(Operation, ops.len);
        @memcpy(operations, ops);
        return Expression{
            .operations = operations,
            .allocator = allocator,
        };
    }

    pub fn deinit(self: Expression) void {
        self.allocator.free(self.operations);
    }

    /// Parse a simple RPN expression
    /// Format: "2 3 + 4 *" means (2 + 3) * 4
    pub fn parse(allocator: std.mem.Allocator, input: []const u8) !Expression {
        var ops: std.ArrayList(Operation) = .empty;
        errdefer ops.deinit(allocator);

        var iter = std.mem.tokenizeScalar(u8, input, ' ');
        while (iter.next()) |token| {
            if (std.mem.eql(u8, token, "+")) {
                try ops.append(allocator, .{ .op_type = .add });
            } else if (std.mem.eql(u8, token, "-")) {
                try ops.append(allocator, .{ .op_type = .sub });
            } else if (std.mem.eql(u8, token, "*")) {
                try ops.append(allocator, .{ .op_type = .mul });
            } else if (std.mem.eql(u8, token, "/")) {
                try ops.append(allocator, .{ .op_type = .div });
            } else if (std.mem.eql(u8, token, "neg")) {
                try ops.append(allocator, .{ .op_type = .neg });
            } else {
                // Try to parse as number
                const value = std.fmt.parseInt(i64, token, 10) catch {
                    std.debug.print("Error: unknown token '{s}'\n", .{token});
                    return error.InvalidToken;
                };
                try ops.append(allocator, .{ .op_type = .load_const, .value = value });
            }
        }

        const operations = try ops.toOwnedSlice(allocator);
        return Expression{
            .operations = operations,
            .allocator = allocator,
        };
    }

    pub fn print(self: Expression) void {
        std.debug.print("Expression: ", .{});
        for (self.operations) |op| {
            switch (op.op_type) {
                .load_const => std.debug.print("{} ", .{op.value.?}),
                .add => std.debug.print("+ ", .{}),
                .sub => std.debug.print("- ", .{}),
                .mul => std.debug.print("* ", .{}),
                .div => std.debug.print("/ ", .{}),
                .neg => std.debug.print("neg ", .{}),
            }
        }
        std.debug.print("\n", .{});
    }
    
};

// Tests

test "parse simple RPN expression" {
    const expr = try Expression.parse(std.testing.allocator, "2 3 +");
    defer expr.deinit();
    
    try std.testing.expectEqual(@as(usize, 3), expr.operations.len);
    try std.testing.expectEqual(OpType.load_const, expr.operations[0].op_type);
    try std.testing.expectEqual(@as(i64, 2), expr.operations[0].value.?);
    try std.testing.expectEqual(OpType.load_const, expr.operations[1].op_type);
    try std.testing.expectEqual(@as(i64, 3), expr.operations[1].value.?);
    try std.testing.expectEqual(OpType.add, expr.operations[2].op_type);
}
