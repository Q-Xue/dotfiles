"---------------- compiler ---------------"
function! s:SetCompiler()
        execute 'setlocal makeprg=cargo\ run'
endfunction

augroup PyCompiler
  autocmd!
  au BufEnter *.rs call s:SetCompiler()
augroup end

nnoremap <buffer> <leader>m :silent make! <bar> copen<CR>
