if exists("g:zig_loaded")
  finish
endif
let g:zig_loaded = 1

function! s:fmt_autosave()
  if get(g:, "zig_fmt_autosave", 1)
    call zig#fmt#Format()
  endif
endfunction

augroup vim-zig
  autocmd!
  autocmd BufWritePre *.zig call s:fmt_autosave()
augroup end

" vim: sw=2 ts=2 et
