const std = @import("std");
extern "c" fn pthread_jit_write_protect_np(enabled: c_int) void;

pub const Executor = struct {
    memory: []align(std.heap.pageSize()) u8,
    allocator: std.mem.Allocator,
    current_offset: u64,

    pub fn init(allocator: std.mem.Allocator, size: usize) !Executor {
        const memory = try allocateExecutableMemory(size);
        return Executor{
            .memory = memory,
            .allocator = allocator,
            .current_offset = 0,
        };
    }

    pub fn deinit(self: *Executor) void {
        freeExecutableMemory(self.memory);
    }

    pub fn printMemory(self: *Executor) void {
        for (self.memory[0..self.current_offset], 0..) |value, i| {
            std.debug.print("{X:0>2} ", .{value});
            if ((i + 1) % 4 == 0) std.debug.print("\n", .{});
        }

        if (self.memory.len % 4 != 0) std.debug.print("\n", .{});
    }

    pub fn getCodePointer(self: *Executor, offset: usize, comptime FuncType: type) !FuncType {
        try std.posix.mprotect(self.memory, std.posix.PROT.READ | std.posix.PROT.EXEC);
        const ptr = @as([*]u8, @ptrCast(self.memory.ptr)) + offset;
        return @as(FuncType, @ptrCast(@alignCast(ptr)));
    }

    pub fn writeCode(self: *Executor, code: []const u8) !void {
        pthread_jit_write_protect_np(0);
        const nz = self.current_offset + code.len;
        if (nz > self.memory.len) {
            return error.OutOfMemory;
        }
        @memcpy(self.memory[self.current_offset..nz], code[0..code.len]);
        self.current_offset = nz;
        pthread_jit_write_protect_np(1);
    }

    pub fn clear(self: *Executor) void {
        @memset(self.memory, 0);
    }
};

pub fn allocateExecutableMemory(size: usize) ![]align(std.heap.pageSize()) u8 {
    const page = std.heap.pageSize();
    const aligned_size = std.mem.alignForward(usize, size, page);

    const prot = std.posix.PROT.READ | std.posix.PROT.WRITE;
    const flags = std.posix.MAP{ .TYPE = .PRIVATE, .ANONYMOUS = true, .JIT = true };

    const ptr = try std.posix.mmap(
        null,
        aligned_size,
        prot,
        flags,
        -1,
        0,
    );

    const aligned_ptr: [*]align(page) u8 = @ptrCast(@alignCast(ptr));
    return aligned_ptr[0..aligned_size];
}

pub fn freeExecutableMemory(memory: []align(std.heap.pageSize()) u8) void {
    std.posix.munmap(memory);
}

test "allocate executable memory" {
    const memory = try allocateExecutableMemory(4096);
    defer freeExecutableMemory(memory);

    try std.testing.expect(memory.len >= 4096);

    pthread_jit_write_protect_np(0);

    // Write a simple "return 42" function
    // mov x0, #42; ret
    const code = [_]u8{ 0x40, 0x05, 0x80, 0xD2, 0xC0, 0x03, 0x5F, 0xD6 };
    std.debug.print("code: {X}\n", .{code});
    @memcpy(memory[0..code.len], &code);

    pthread_jit_write_protect_np(1);

    try std.posix.mprotect(memory, std.posix.PROT.READ | std.posix.PROT.EXEC);

    const func: *const fn () callconv(.c) i64 = @ptrCast(@alignCast(memory.ptr));
    const result = func();

    try std.testing.expectEqual(@as(i64, 42), result);
}
