" IMproved...
set nocompatible
set encoding=utf-8


" File handling
set backup
set backupdir=~/.local/share/nvim/backup
set backupskip=~/.local/share/nvim/backup/*

set swapfile
set dir=~/.local/share/nvim/swap

" Sane searching
set hlsearch   " Highlight search
set incsearch  " Incremental searching
set ignorecase " Case insensitive matching in search
" Make double-<Esc> clear search highlights
nnoremap <silent> <Esc><Esc> <Esc>:noh<CR><Esc>

" Formatting
set fo+=o  " Auto insert comment leader after hitting o/O in normal mode
set fo-=r  " ... but not after a line break
set fo-=t  " No auto wrap of text using textwidth, comments excluded

set nowrap
set textwidth=0  " No default wrapping of text

set backspace=indent,eol,start  " Power Erasing(TM)

set shiftwidth=2  " Indentation stride
set tabstop=2  " Default tabstop
set softtabstop=2
set expandtab  " Spaces > tabs
set smarttab

set autoindent

" Visual stuff
set number relativenumber
set showmatch  " Matching brackets
set matchtime=0  " Bracket blinking
set visualbell t_vb=  " No visible blinking
set noerrorbells  " SHADAP
set laststatus=2  " Always show statusline
set ruler  " Top/Bot/All/X%
set showcmd  " Show commands as they're being typed
set shortmess=atI  " Shorter messages from vim, also no intro text

set list  " Print the unprintables(!)
set listchars=tab:>·,trail:·,extends:»,precedes:«  " Unprintables etc.

set foldenable
set foldmethod=marker  " Folds are specified with markers
set foldlevel=100  " No autofolding
set foldopen=hor,mark,percent,quickfix,tag  " Fold opening movements

set mouse=n    " Enable mouse
set mousehide  " Hide mouse once the typing begins

set splitbelow  " Split below when splitting vertically
set splitright  " Split to the right when splitting horisontally

" Disable Arrow keys in Escape mode
map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>

" Disable Arrow keys in Insert mode
imap <up> <nop>
imap <down> <nop>
imap <left> <nop>
imap <right> <nop>

highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/

" Specify a directory for plugins
call plug#begin('~/.local/share/nvim/plugged')

Plug 'NLKNguyen/papercolor-theme'

call plug#end()

" Theme
syntax on
set synmaxcol=800  " Highlight lines of at most 800 characters length
set background=dark
colorscheme PaperColor
hi Normal guibg=NONE ctermbg=NONE
