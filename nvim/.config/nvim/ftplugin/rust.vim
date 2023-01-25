"---------------- fold method --------------"
setlocal foldmethod=manual
autocmd BufWinLeave *.rs mkview
autocmd BufWinEnter *.rs silent loadview



"---------------- compiler ---------------"
function! s:SetCompiler()
        execute 'setlocal makeprg=cargo\ run'
endfunction

augroup RustCompiler
  autocmd!
  au BufEnter *.rs call s:SetCompiler()
augroup end

nnoremap <buffer> <leader>m :silent make! <bar> copen<CR>
