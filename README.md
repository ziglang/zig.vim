# zig.vim

File detection and syntax highlighting for the
[zig](http://ziglang.org/) programming language.

## Installation

### If using [**vim-plug**](https://github.com/junegunn/vim-plug) (for Vim or Neovim)
 * Open vim config
 * Write `Plug 'ziglang/zig.vim'` inside the `plug` command:
  ```vim
  call plug#begin('~/.vim/plugged')
     Plug 'ziglang/zig.vim'
  call plug#end()
  ```
   
  * Restart vim / reload vim config
  * type `:PlugInstall`
  
### If using **Vim**:
 * Use Vim 8 or newer
 * `mkdir -p ~/.vim/pack/plugins/start/`
 * `cd ~/.vim/pack/plugins/start/`
 * `git clone https://github.com/ziglang/zig.vim`

### If using **Neovim**:
 * `mkdir -p ~/.local/share/nvim/site/pack/plugins/start/`
 * `cd ~/.local/share/nvim/site/pack/plugins/start/`
 * `git clone https://github.com/ziglang/zig.vim`

## Configuration

This plugin enables automatic code formatting on save by default using
`zig fmt`. To disable it, you can use this configuration in vimrc:

```
let g:zig_fmt_autosave = 0
```

The default compiler which gets used by `:make` (`:help :compiler` for details)
is `zig_build` and it runs `zig build`.  The other options are:
 * `:compiler zig_test` which runs `zig test` on the current file.
 * `:compiler zig_build_exe` which runs `zig build-exe` on the current file.
 * `:compiler zig` which requires that a subcommand is passed as an argument
   and it runs on the current file.
