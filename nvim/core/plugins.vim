" Plugin specification and lua stuff
" lua require('lua-init')
lua require('plugins')

" Use short names for common plugin manager commands to simplify typing.
" To use these shortcuts: first activate command line with `:`, then input the
" short alias, e.g., `pi`, then press <space>, the alias will be expanded to
" the full command automatically.
call utils#Cabbrev('pi', 'PackerInstall')
call utils#Cabbrev('pud', 'PackerUpdate')
call utils#Cabbrev('pc', 'PackerClean')
call utils#Cabbrev('ps', 'PackerSync')

" ----------------------------------------------------------------------
" configuration for vimscript plugins
" ----------------------------------------------------------------------

"--------------------------- commentary --------------------------
nnoremap <leader>/ :Commentary<CR>

"-------------------------- vim-matchup settings ---------------------------
" Improve performance
let g:matchup_matchparen_deferred = 1
let g:matchup_matchparen_timeout = 100
let g:matchup_matchparen_insert_timeout = 30

" Enhanced matching with matchup plugin
let g:matchup_override_vimtex = 1

" Whether to enable matching inside comment or string
let g:matchup_delim_noskips = 0

" Show offscreen match pair in popup window
let g:matchup_matchparen_offscreen = {'method': 'popup'}

"-------------------------- vimtex --------------------------
let g:vimtex_view_general_viewer = 'SumatraPDF.exe'




















