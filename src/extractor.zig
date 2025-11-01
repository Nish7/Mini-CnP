const std = @import("std");
const stencils = @import("stencils.zig");

pub const Stencil = struct {
    name: []const u8,
    code: []const u8,
    size: usize,

    pub fn print(self: Stencil) void {
        std.debug.print("Stencil '{s}' ({} bytes): ", .{ self.name, self.size });
        for (self.code[0..self.size], 0..) |byte, i| {
            std.debug.print("{X:0>2} ", .{byte});
            if ((i + 1) % 4 == 0) std.debug.print("\n", .{});
        }
        std.debug.print("\n", .{});
    }
};

/// Extract machine code from a compiled function
/// This reads the actual bytes the compiler generated
pub fn extractStencil(name: []const u8, func_ptr: *const anyopaque, max_size: usize) !Stencil {
    const code_ptr: [*]const u8 = @ptrCast(func_ptr);
    const full_size = findARM64FunctionSize(code_ptr, max_size);
    const full_code = code_ptr[0..full_size];

    const is_final = std.mem.eql(u8, name, "pop_return");
    const body = stripStencilFrame(full_code, is_final);

    return Stencil{
        .name = name,
        .code = body.ptr[0..body.len],
        .size = body.len,
    };
}

/// Find ARM64 function size by looking for 'ret' instruction
/// ARM64 ret is encoded as 0xD65F03C0 (little-endian: C0 03 5F D6)
fn findARM64FunctionSize(code_ptr: [*]const u8, max_size: usize) usize {
    var size: usize = 0;

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

pub fn copyStencil(dest: []u8, stencil: Stencil) !usize {
    if (dest.len < stencil.size) {
        return error.BufferTooSmall;
    }

    @memcpy(dest[0..stencil.size], stencil.code[0..stencil.size]);
    return stencil.size;
}

pub fn stripStencilFrame(code: []const u8, is_epilogue: bool) []const u8 {
    var start: usize = 0;
    var end: usize = code.len;

    start = skipPrologue(code);

    if (!is_epilogue) {
        end = findEpilogueStart(code);
        if (end == 0) end = code.len;
    }

    return code[start..end];
}

fn skipPrologue(code: []const u8) usize {
    var offset: usize = 0;

    if (offset + 4 <= code.len) {
        const inst = std.mem.readInt(u32, code[offset..][0..4], .big);
        if (inst == 0xFD7BBFA9) {
            offset += 4;
        }
    }

    if (offset + 4 <= code.len) {
        const inst = std.mem.readInt(u32, code[offset..][0..4], .big);
        if (inst == 0xFD030091) {
            offset += 4;
        }
    }

    return offset;
}

fn findEpilogueStart(code: []const u8) usize {
    if (code.len < 8) return code.len;

    var end = code.len;

    if (end >= 4) {
        const last = std.mem.readInt(u32, code[end - 4 ..][0..4], .big);
        if (last == 0xC0035FD6) {
            end -= 4;
        }
    }

    if (end >= 4) {
        const last = std.mem.readInt(u32, code[end - 4 ..][0..4], .big);
        if (last == 0xFD7BC1A8) {
            end -= 4;
        }
    }

    return end;
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

test "extraction" {
    const stencil = try extractStencil("push_const", @ptrCast(&stencils.push_const_stencil), 256);
    stencil.print();
}
