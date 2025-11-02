const std = @import("std");
const compiler = @import("compiler.zig");

pub const Context = struct {
    stack: [256]i64,
    sp: usize,

    pub fn init() Context {
        return .{
            .stack = [_]i64{ 3, 5 } ++ [_]i64{undefined} ** 254,
            .sp = 2,
        };
    }
};

pub export fn push_const_stencil(ctx: *Context) callconv(.c) void {
    @setRuntimeSafety(false);
    const value: i64 = 0x123456780ABCDEF0; // 16 bits
    ctx.stack[ctx.sp] = value;
    ctx.sp += 1;
}

pub export fn add_stencil(ctx: *Context) callconv(.c) void {
    @setRuntimeSafety(false);
    ctx.sp -= 1;
    const b = ctx.stack[ctx.sp];
    ctx.sp -= 1;
    const a = ctx.stack[ctx.sp];
    ctx.stack[ctx.sp] = a + b;
    ctx.sp += 1;
}

pub export fn sub_stencil(ctx: *Context) callconv(.c) void {
    ctx.sp -= 1;
    const b = ctx.stack[ctx.sp];
    ctx.sp -= 1;
    const a = ctx.stack[ctx.sp];
    ctx.stack[ctx.sp] = a - b;
    ctx.sp += 1;
}

pub export fn mul_stencil(ctx: *Context) callconv(.c) void {
    ctx.sp -= 1;
    const b = ctx.stack[ctx.sp];
    ctx.sp -= 1;
    const a = ctx.stack[ctx.sp];
    ctx.stack[ctx.sp] = a * b;
    ctx.sp += 1;
}

pub export fn div_stencil(ctx: *Context) callconv(.c) void {
    ctx.sp -= 1;
    const b = ctx.stack[ctx.sp];
    ctx.sp -= 1;
    const a = ctx.stack[ctx.sp];
    if (b != 0) {
        ctx.stack[ctx.sp] = @divTrunc(a, b);
    } else {
        ctx.stack[ctx.sp] = 0; // Simple error handling
    }
    ctx.sp += 1;
}

pub export fn neg_stencil(ctx: *Context) callconv(.c) void {
    ctx.sp -= 1;
    const a = ctx.stack[ctx.sp];
    ctx.stack[ctx.sp] = -a;
    ctx.sp += 1;
}

pub export fn pop_return_stencil(ctx: *Context) callconv(.c) i64 {
    @setRuntimeSafety(false);

    ctx.sp -= 1;
    return ctx.stack[ctx.sp];
}
