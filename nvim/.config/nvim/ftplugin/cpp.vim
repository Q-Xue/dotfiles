"---------------- fold method --------------"
setlocal foldmethod=manual
autocmd BufWinLeave *.cpp mkview
autocmd BufWinEnter *.cpp silent loadview


"---------------- compiler ---------------"
" function! s:SetCompiler()
"   execute 'setlocal makeprg='  . 'lua'
" endfunction

" augroup PyCompiler
"   autocmd!
"   au BufEnter *.lua call s:SetCompiler()
" augroup end

nnoremap <buffer> <leader>mc :silent make! all<CR>
nnoremap <buffer> <leader>mr :silent make! test <bar> copen<CR>
