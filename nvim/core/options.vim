" let mapleader = "\<Space>"
let maplocalleader = "\\"

" change fillchars for folding, vertical split, end of buffer, and message separator
set fillchars=fold:\ ,vert:\│,eob:\ ,msgsep:‾

set splitright
set splitbelow

" Time in milliseconds to wait for a mapped sequence to complete,
" see https://unix.stackexchange.com/q/36882/221410 for more info
set timeoutlen=500
set updatetime=500  " For CursorHold events

" Clipboard settings, always use clipboard for all delete, yank, change, put
" operation, see https://stackoverflow.com/q/30691466/6064933
if !empty(provider#clipboard#Executable())
  set clipboard+=unnamedplus
endif

" Disable creating swapfiles, see https://stackoverflow.com/q/821902/6064933
set noswapfile

" Ignore certain files and folders when globing
set wildignore+=*.o,*.obj,*.dylib,*.bin,*.dll,*.exe
set wildignore+=*/.git/*,*/.svn/*,*/__pycache__/*,*/build/**
set wildignore+=*.jpg,*.png,*.jpeg,*.bmp,*.gif,*.tiff,*.svg,*.ico
set wildignore+=*.pyc,*.pkl
set wildignore+=*.DS_Store
set wildignore+=*.aux,*.bbl,*.blg,*.brf,*.fls,*.fdb_latexmk,*.synctex.gz,*.xdv
set wildignorecase  " ignore file and dir name cases in cmd-completion

" Set up backup directory
let g:backupdir=expand(stdpath('data') . '/backup//')
let &backupdir=g:backupdir

" Skip backup for patterns in option wildignore
let &backupskip=&wildignore
set backup  " create backup for files
set backupcopy=yes  " copy the original file to backupdir and overwrite it

" General tab settings
set tabstop=4       " number of visual spaces per TAB
set softtabstop=4   " number of spaces in tab when editing
set shiftwidth=4    " number of spaces to use for autoindent
set expandtab       " expand tab to spaces so that tabs are spaces

" Set matching pairs of characters and highlight matching brackets
set matchpairs+=<:>,「:」,『:』,【:】,“:”,‘:’,《:》

set number relativenumber  " Show line number and relative line number

" Ignore case in general, but become case-sensitive when uppercase is present
set ignorecase smartcase

" File and script encoding settings for vim
set fileencoding=utf-8
set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1

" Break line at predefined characters
set linebreak
" Character to show before the lines that have been soft-wrapped
set showbreak=↪

" List all matches and complete till longest common string
set wildmode=list:longest

" Minimum lines to keep above and below cursor when scrolling
set scrolloff=3

" Use mouse to select and resize windows, etc.
" set mouse=nic  " Enable mouse in several mode
" set mousemodel=popup  " Set the behaviour of mouse
set mouse=a

" " Disable showing current mode on command line since statusline plugins can show it.
" set noshowmode

" set fileformats=unix,dos  " Fileformats to use for new files

" Ask for confirmation when handling unsaved or read-only files
set confirm

set visualbell noerrorbells  " Do not use visual and errorbells
set history=500  " The number of command and search history to keep

" Use list mode and customized listchars
set list listchars=tab:▸\ ,extends:❯,precedes:❮,nbsp:␣

" Auto-write the file based on some condition
set autowrite

set termguicolors








""========== colorscheme ==========="
"if has('termguicolors')
   "set termguicolors
"endif
"
"set background=dark
"let g:gruvbox_material_background = 'hard'
"let g:gruvbox_material_enable_italic = 1
"let g:gruvbox_material_enable_bold = 1
"" let g:gruvbox_material_transparent_background = 1
"" let g:gruvbox_material_disable_terminal_colors = 1
"let g:gruvbox_material_better_performance = 1
"colorscheme gruvbox-material
"
"
"let g:everforest_background = 'hard'
"let g:everforest_enable_italic = 1

"========== general settings =========="
" set mouse=a
set hidden
set nowrap
set iskeyword+=-
set laststatus=3
set cmdheight=2
set autoindent
set smartindent
set colorcolumn=80
set path+=**
set diffopt+=vertical
set cursorline
set grepprg=rg\ --vimgrep\ --smart-case\ --follow
