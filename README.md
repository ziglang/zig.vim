# zig.vim

File detection and syntax highlighting for the
[zig](http://ziglang.org/) programming language.

## Installation

If using **Vim**:
 * Use Vim 8 or newer
 * `mkdir -p ~/.vim/pack/plugins/start/`
 * `cd ~/.vim/pack/plugins/start/`
 * `git clone https://github.com/ziglang/zig.vim`

If using **Neovim**:
 * `mkdir -p ~/.local/share/nvim/site/pack/plugins/start/`
 * `cd ~/.local/share/nvim/site/pack/plugins/start/`
 * `git clone https://github.com/ziglang/zig.vim`

## Configuration

This plugin enables automatic code formatting on save by default using
`zig fmt`. To disable it, you can use this configuration in vimrc:

```
let g:zig_fmt_autosave = 0
```
