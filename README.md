# zig.vim

File detection and syntax highlighting for the
[zig](http://ziglang.org/) programming language.

## Installation

 * Use Vim 8 or newer
 * `mkdir -p ~/.vim/pack/plugins/start/`
 * `cd ~/.vim/pack/plugins/start/`
 * `git clone https://github.com/ziglang/zig.vim`

## Configuration

To enable automatic formatting on save, follow these steps:

 * Build the zig [stage 2 compiler](https://github.com/ziglang/zig#stage-2-build-self-hosted-zig-from-zig-source-code).
 * Copy the resulting binary into your path.
 * Add the following configuration to your vimrc, where `zig2` is the stage 2
   compiler binary:

```
let g:zig_fmt_autosave = 1
let g:zig_fmt_command = ['zig2', 'fmt', '--color', 'off']
```
