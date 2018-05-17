" Adapted from vim-go: autoload/go/path.vim
"
" Copyright 2011 The Go Authors. All rights reserved.
" Use of this source code is governed by a BSD-style
" license that can be found in the LICENSE file.
"

" BinPath returns the binary path of installed zig
function! zig#path#BinPath() abort
  let bin_path = zig#config#BinPath()
  if bin_path != ""
    return bin_path
  endif

  return ""
endfunction

" CheckBinPath checks whether the given binary exists or not and returns the
" path of the binary. It returns an empty string doesn't exists.
function! zig#path#CheckBinPath(binpath) abort
  " remove whitespaces if user applied something like 'goimports   '
  let binpath = substitute(a:binpath, '^\s*\(.\{-}\)\s*$', '\1', '')

  " save original path
  let old_path = $PATH

  " check if we have an appropriate bin_path
  let zig_bin_path = zig#path#BinPath()
  if zig_bin_path == ""
    call zig#util#EchoError(printf("zig_bin_path is not set! %s", ''))
    return ""
  endif

  " if it's in PATH just return it
  if executable(binpath)
    if exists('*exepath')
      let binpath = exepath(binpath)
    endif
    let $PATH = old_path

    if zig#util#IsUsingCygwinShell() == 1
      return s:CygwinPath(binpath)
    endif

    return binpath
  endif

  " just get the basename
  let basename = fnamemodify(binpath, ":t")
  if !executable(basename)
    call zig#util#EchoError(printf("could not find '%s'", basename))

    " restore back!
    let $PATH = old_path
    return ""
  endif

  let $PATH = old_path

  if zig#util#IsUsingCygwinShell() == 1
    return s:CygwinPath(a:binpath)
  endif

  return zig_bin_path . zig#util#PathSep() . basename
endfunction

function! s:CygwinPath(path)
   return substitute(a:path, '\\', '/', "g")
endfunction

" vim: sw=2 ts=2 et
