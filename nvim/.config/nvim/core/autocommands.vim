"============== packer compile =============
" Auto-generate packer_compiled.lua file
augroup packer_auto_compile
  autocmd!
  autocmd BufWritePost */nvim/lua/valio/plugins.lua source <afile> | PackerCompile
augroup END

"============== uncap =============
" nvim-qt takes forever to run external command!!
" " Auto run uncap if it is not started yet
" function s:uncap() abort
"   if exists("g:uncap_is_on")
"       return
"   else
"       echom "uncap not running"
"       let g:uncap_is_on = 1
"       execute "!" . "uncap"
"   endif
" endfunction

" augroup uncap
"   autocmd!
"   autocmd VimEnter * :call s:uncap()
" augroup END

"============== ctag =============
" augroup ctag_auto_update
"     autocmd!
"     autocmd BufWritePost *.py silent !ctags -R .
" augroup END
