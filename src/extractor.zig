const std = @import("std");

/// Stencil represents extracted machine code from a compiled function
pub const Stencil = struct {
    name: []const u8,
    code: []const u8,
    size: usize,

    pub fn print(self: Stencil) void {
        std.debug.print("Stencil '{s}' ({} bytes): ", .{ self.name, self.size });
        for (self.code[0..self.size]) |byte| {
            std.debug.print("{X:0>2} ", .{byte});
        }
        std.debug.print("\n", .{});
    }
};

/// Extract machine code from a compiled function
/// This reads the actual bytes the compiler generated
pub fn extractStencil(name: []const u8, func_ptr: *const anyopaque, max_size: usize) !Stencil {
    const code_ptr: [*]const u8 = @ptrCast(func_ptr);

    // Find the size by looking for return instruction
    const size = findARM64FunctionSize(code_ptr, max_size);

    return Stencil{
        .name = name,
        .code = code_ptr[0..max_size],
        .size = size,
    };
}

/// Find ARM64 function size by looking for 'ret' instruction
/// ARM64 ret is encoded as 0xD65F03C0 (little-endian: C0 03 5F D6)
fn findARM64FunctionSize(code_ptr: [*]const u8, max_size: usize) usize {
    var size: usize = 0;

    // ARM64 instructions are 4 bytes, aligned
    while (size + 4 <= max_size) : (size += 4) {
        // Check for 'ret' instruction: D65F03C0
        if (code_ptr[size] == 0xC0 and
            code_ptr[size + 1] == 0x03 and
            code_ptr[size + 2] == 0x5F and
            code_ptr[size + 3] == 0xD6)
        {
            return size + 4;
        }
    }

    return max_size;
}

/// Copy stencil code to destination buffer
pub fn copyStencil(dest: []u8, stencil: Stencil) !usize {
    if (dest.len < stencil.size) {
        return error.BufferTooSmall;
    }

    @memcpy(dest[0..stencil.size], stencil.code[0..stencil.size]);
    return stencil.size;
}

/// Patch a constant value in the stencil at given offset
/// This modifies the copied machine code to use a different value
pub fn patchConstant(code: []u8, offset: usize, value: i64) !void {
    if (offset + @sizeOf(i64) > code.len) {
        return error.PatchOffsetOutOfBounds;
    }

    std.mem.writeInt(i64, code[offset..][0..8], value, .little);
}

// Test helpers for verification

/// A simple test function to extract
fn test_return_42() callconv(.c) i64 {
    return 42;
}

test "extract machine code from function" {
    const stencil = try extractStencil("test_return42", @ptrCast(&test_return_42), 64);

    try std.testing.expect(stencil.size > 0);
    try std.testing.expect(stencil.size <= 64);

    stencil.print();
}

test "copy stencil to buffer" {
    const stencil = try extractStencil("test_return", @ptrCast(&test_return_42), 64);

    var buffer: [128]u8 = undefined;
    const copied_size = try copyStencil(&buffer, stencil);

    try std.testing.expectEqual(stencil.size, copied_size);
    try std.testing.expectEqualSlices(u8, stencil.code[0..stencil.size], buffer[0..copied_size]);
}

test "patch constant in code" {
    var code = [_]u8{ 0x48, 0xB8, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xC3 };

    try patchConstant(&code, 2, 0x123456789ABCDEF0);

    const patched_value = std.mem.readInt(i64, code[2..][0..8], .little);
    try std.testing.expectEqual(@as(i64, 0x123456789ABCDEF0), patched_value);
}
