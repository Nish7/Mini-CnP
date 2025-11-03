# Mini-CnP
> Copy and Patch Implementation in Zig

## Run Test
`zig test src/compiler.zig`

## Disassembly Notes:
- `zig build-obj stencils.zig -O ReleaseFast -target aarch64-macos`
- `objdump -d stencils.o`
- To output asm: `zig build-obj src/stencils.zig -femit-asm=asm/stencils.s -O ReleaseFast -target aarch64-macos`
Note: outputs in the asm dir for debugging purposes.


References:
- https://fredrikbk.com/publications/copy-and-patch.pdf
- https://scot.tg/2024/12/22/worked-example-of-copy-and-patch-compilation/
- https://news.ycombinator.com/item?id=45576502
- https://sillycross.github.io/2022/11/22/2022-11-22/
- https://injuly.in/blog/jit-01/
