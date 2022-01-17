if exists("g:zig_loaded")
  finish
endif
let g:zig_loaded = 1

function! s:on_save()
  if get(g:, "zig_fmt_ast_check_autosave", 0)
    call zig#fmt#Format(v:true)
  else
    if get(g:, "zig_fmt_autosave", 1)
      call zig#fmt#Format(v:false)
    endif
    if get(g:, "zig_ast_check_autosave", 1)
      call zig#fmt#Astcheck()
    endif
  endif
endfunction

augroup vim-zig
  autocmd!
  autocmd BufWritePre *.zig call s:on_save()
augroup end

" vim: sw=2 ts=2 et
