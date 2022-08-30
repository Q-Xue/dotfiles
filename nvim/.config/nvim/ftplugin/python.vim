"---------------- fold method --------------"
setlocal foldmethod=manual
autocmd BufWinLeave *.py mkview
autocmd BufWinEnter *.py silent loadview


"---------------- virtual environment ------------------"
function! s:AddToEnvPath()
    if g:is_win
        if stridx($Path, getcwd() . '\venv\Scripts') == 0
            return
        endif
        let $Path = getcwd() . '\venv\Scripts' . ';' . $Path

    elseif g:is_linux || g:is_mac
        if stridx($PATH, getcwd() . '/venv/bin') == 0
            return
        endif
        let $PATH = getcwd() . '/venv/bin' . ';' . $PATH
    endif
endfunction

function! s:RemoveFromEnvPath()
    if g:is_win
        let $Path = strpart($Path, stridx($Path,";")+1)
    elseif g:is_linux || g:is_mac
        let $PATH = strpart($PATH, stridx($PATH, ";")+1)
    endif
endfunction

augroup PyEnv
  autocmd!
  au BufEnter *.py call s:AddToEnvPath()
  au BufLeave *.py call s:RemoveFromEnvPath()
augroup end


"---------------- compiler ---------------"
function! s:SetCompiler()
    if g:is_win
        execute 'setlocal makeprg=' . getcwd() . '\venv\Scripts\python'
    elseif g:is_linux || g:is_mac
        execute 'setlocal makeprg=' . getcwd() . '/venv/bin/python'
    endif
endfunction

augroup PyCompiler
  autocmd!
  au BufEnter *.py call s:SetCompiler()
augroup end

nnoremap <buffer> <leader>m :silent make! % <bar> copen<CR>
