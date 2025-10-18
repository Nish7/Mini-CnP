# Mini-CnP
> Copy and Patch Implementation in Zig

## Disassembly Notes:
- `zig build-obj stencils.zig -O ReleaseFast -target aarch64-macos`
- `objdump -d stencils.o`
- To output asm: `zig build-obj src/stencils.zig -femit-asm=asm/stencils.s -O ReleaseFast -target aarch64-macos`
Note: outputs in the asm dir for debugging purposes.


References:
- https://fredrikbk.com/publications/copy-and-patch.pdf
- https://scot.tg/2024/12/22/worked-example-of-copy-and-patch-compilation/
