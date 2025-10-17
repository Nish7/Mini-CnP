const std = @import("std");

pub const Context = struct {
    stack: [256]i64,
    sp: usize,

    pub fn init() Context {
        return .{
            .stack = undefined,
            .sp = 0,
        };
    }
};

/// Push a constant onto the stack
pub fn push_const_stencil(ctx: *Context) void {
    @setRuntimeSafety(false);
    const value:i64 = 0x1111_1111_1111_1111;
    ctx.stack[ctx.sp] = value;
    ctx.sp += 1;
}

/// Add: pop 2 values, push sum
pub fn add_stencil(ctx: *Context) callconv(.c) void {
    @setRuntimeSafety(false);
    
    ctx.sp -= 1;
    const b = ctx.stack[ctx.sp];
    ctx.sp -= 1;
    const a = ctx.stack[ctx.sp];
    ctx.stack[ctx.sp] = a + b;
    ctx.sp += 1;
}

/// Subtract: pop 2 values, push difference (a - b)
pub fn sub_stencil(ctx: *Context) callconv(.c) void {
    ctx.sp -= 1;
    const b = ctx.stack[ctx.sp];
    ctx.sp -= 1;
    const a = ctx.stack[ctx.sp];
    ctx.stack[ctx.sp] = a - b;
    ctx.sp += 1;
}

/// Multiply: pop 2 values, push product
pub fn mul_stencil(ctx: *Context) callconv(.c) void {
    ctx.sp -= 1;
    const b = ctx.stack[ctx.sp];
    ctx.sp -= 1;
    const a = ctx.stack[ctx.sp];
    ctx.stack[ctx.sp] = a * b;
    ctx.sp += 1;
}

/// Divide: pop 2 values, push quotient (a / b)
pub fn div_stencil(ctx: *Context) callconv(.c) void {
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

/// Negate: pop 1 value, push negation
pub fn neg_stencil(ctx: *Context) callconv(.c) void {
    ctx.sp -= 1;
    const a = ctx.stack[ctx.sp];
    ctx.stack[ctx.sp] = -a;
    ctx.sp += 1;
}

/// Pop top of stack and return it
/// This is the ONLY stencil that returns a value!
pub fn pop_return_stencil(ctx: *Context) callconv(.c) i64 {
    ctx.sp -= 1;
    return ctx.stack[ctx.sp];
}
