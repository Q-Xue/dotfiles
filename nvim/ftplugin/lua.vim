"---------------- fold method --------------"
setlocal foldmethod=manual
autocmd BufWinLeave *.lua mkview
autocmd BufWinEnter *.lua silent loadview


"---------------- compiler ---------------"
function! s:SetCompiler()
  execute 'setlocal makeprg='  . 'lua'
endfunction

augroup PyCompiler
  autocmd!
  au BufEnter *.lua call s:SetCompiler()
augroup end

nnoremap <buffer> <leader>m :silent make! % <bar> copen<CR>
