# Mini-CnP
> Copy and Patch Implementation in Zig

Research Notes:
- Takes Reverse Polish Notation as input for evaluation interpretation (Simplicity sakes)
- stencils also assume c calling convention usign `callconv .c`
- Basic OP: add, sub, div, mul, div, neg, push, pop
    - Basic stack handling and arithmetics.
- pre-compiled stencils (currently using runtime cache) 
   -  Could use prebuild stencils instead. investigate
- Flow: Stencils -> allocated buffer -> executable code
- TODO: Change it to CPS style execution flow. 
  - expect it to be not so difficult

Expected Issues:
- Pass stack pointer using `context` within a single register. 
    - solves the ctx passing between stencils.
- Architecture agonostic code. Current `executor` and other components assumes aarch(arm64). 
- MacOS specific safety guard handling needs to be removed other platforms.

References:
- https://fredrikbk.com/publications/copy-and-patch.pdf
- https://scot.tg/2024/12/22/worked-example-of-copy-and-patch-compilation/
