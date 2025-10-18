# DONOTREADME

## Research Notes:
- Takes Reverse Polish Notation as input for evaluation interpretation (Simplicity sakes)
- stencils also assume c calling convention usign `callconv .c`
- Basic OP: add, sub, div, mul, div, neg, push, pop
    - Basic stack handling and arithmetics.
- pre-compiled stencils (currently using runtime cache) 
   -  Could use prebuild stencils instead. investigate
- Flow: Stencils -> allocated buffer -> executable code
- TODO: Change it to CPS style execution flow. 
  - expect it to be not so difficult
  
## OS Notes: (Relevance on epilogue and prologue handling):

- Stack Pointer: Points to the top of the stack
- Frame Pointer: base of the stack frame.
- There is only one stack for each thread of your program
- Each function get a frame, and all the frame live together on the stack
- Link pointers are usually stored on the stackl
  - they say where to go next when this function ends

## Calling Convention:
- C calling convention btw

Return 42 Disassembly:
```c
FD 7B BF A9  →  STP X29, X30, [SP, #-16]!
FD 03 00 91  →  MOV X29, SP
48 05 80 52  →  MOV W8, #0x2A        ; 42 decimal
E0 03 08 AA  →  MOV X0, X8
FD 7B C1 A8  →  LDP X29, X30, [SP], #16
C0 03 5F D6  →  RET
```

Prologue: Saves the frame pointer, link register, establish a new frame pointer

`STP X29, X30, [SP, #-16]!`: Store pair
Preserver the caller's frame and link pointers.
- Decrements the stack pointer by 16bytes. immediately to reserver the register saving space.
- Store old x29 value at SP (previously +16)
- Store old link register at SP + 8 byte. which holds the return address

`MOV X29, SP` - Move
Mark the base of this function stack frame
Esablish a new stack frame, save caller state and prepate for locals
- Set X29 to current SP

Body: Self Explanatory

Epologue: Restore FP, LR.
`LDP X29, X30, [SP], #16`
Load back saved X29 and X30 from the stack
Increase SP by 16 bytes
- `RET`
Jump to address in `X30`

arm64:
x29 -> Frame pointer
x30 -> link register
x0 -> return register

Stencil Disassembly: 

`push_const` for patch point investigation
```
sub sp, sp, #0x30 -> decrement SP by 48; reserver stack space; 
stp x29, x30, [sp, #0x20] -> decremeent evern more for register saving
add x29, sp, #0x20 -> sets FP with SP + 32; starts from ^
mov x8, x0 -> reuse x0 -> x8; it is ctx pointer
str x8, [sp, #8]
mov x8, x0
str x8, [sp, #0x10]
mov x8, #0
stur xzr, [x29, #-8]
ldr x9, [sp, #0x10]
ldr x10, [x0, #0x800]
str x8, [x9, x10, lsl #3]
ldr x9, [sp, #0x10]
ldr x8, [x9, #0x800]
add x8, x8, #1
str x8, [x9, #0x800]
ldp x29, x30, [sp, #0x20]
add sp, sp, #0x30
ret 
```

`add` 
```
sub sp, sp, #0x30
stp x29, x30, [sp, #0x20]
add x29, sp, #0x20
mov x8, x1
str x8, [sp, #8]
mov x8, x1
str x8, [sp, #0x10]
mov x8, #0
stur xzr, [x29, #-8]
ldr x9, [sp, #0x10]
ldr x10, [x1, #0x800]
str x8, [x9, x10, lsl #3]
ldr x9, [sp, #0x10]
ldr x8, [x9, #0x800]
add x8, x8, #1
str x8, [x9, #0x800]
ldp x29, x30, [sp, #0x20]
add sp, sp, #0x30
ret 
```

Prologue (first 3 instructions):
```arm64
sub sp, sp, #0x30              ; Allocate 48 bytes of stack
stp x29, x30, [sp, #0x20]      ; Save frame pointer & link register
add x29, sp, #0x20             ; Setup frame pointer
```

Epilogue (last 3 instructions):
```arm64
ldp x29, x30, [sp, #0x20]      ; Restore frame pointer & link register
add sp, sp, #0x30              ; Deallocate stack
ret                            ; Return
```

The body is ONLY these lines:
```arm64
mov x8, #0                     ; Load constant (PATCH POINT!)
ldr x9, [sp, #0x10]            ; Load ctx pointer
ldr x10, [x0, #0x800]          ; Load ctx.sp
str x8, [x9, x10, lsl #3]      ; ctx.stack[sp] = value
add x8, x8, #1                 ; sp++
str x8, [x9, #0x800]           ; Store back
```

Relocations:
- This was because of my investigation of using `extern` or global patch marker.
- source -compiler-> main.s -assmebler-> main.o -linker-> main executable
- "During the compilation process of a program there is a specific stage where relocatable objects are generated. These relocatable objects contain all the information required to map symbolic references to its corresponding definitions. Populating symbolic references on symbolic definitions takes place during the linking phase of the compilation process."
- https://intezer.com/blog/executable-and-linkable-format-101-part-3-relocations/
- https://blog.cloudflare.com/how-to-execute-an-object-file-part-4/?utm_source=chatgpt.com/

Expected Issues:
- Pass stack pointer using `context` within a single register. 
    - solves the ctx passing between stencils.
- Architecture agonostic code. Current `executor` and other components assumes aarch(arm64). 
- MacOS specific safety guard handling needs to be removed other platforms.

- Patch Point: how to define a patch point within zig code? zero value? -1 value or big magic number?
  - look at the zig relocation table and relocatblae symbol
  - attaching a label? in zig?
  - Symbolic Patch Points using 
  

  
Tools:
https://ret.futo.org/arm64/ -> Disassemebly Tool
- https://courses.cs.washington.edu/courses/cse469/19wi/arm64.pdf
- https://blog.reverberate.org/2025/02/10/tail-call-updates.html
