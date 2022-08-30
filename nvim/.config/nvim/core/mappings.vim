nnoremap <leader>ev :vsp $MYVIMRC<CR>
nnoremap <leader>sv :source $MYVIMRC<CR>

inoremap jk <Esc>
inoremap kj <Esc>

nnoremap <S-h> :bnext<CR>
nnoremap <S-l> :bprevious<CR>

nnoremap <C-s> :w<CR>
nnoremap <C-q> :wq!<CR>

nnoremap ; :
vnoremap ; :

nnoremap <silent> <F2> :call utils#ToggleQuickFix()<cr>

nnoremap <Left> <C-W>h
nnoremap <Right> <C-W>l
nnoremap <Up> <C-W>k
nnoremap <Down> <C-W>j

nnoremap <M-h> <C-W>h
nnoremap <M-l> <C-W>l
nnoremap <M-k> <C-W>k
nnoremap <M-j> <C-W>j
