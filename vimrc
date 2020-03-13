" IMproved...
set nocompatible
set encoding=utf-8

" File handling
set backup
set backupdir=~/.local/share/vim/backup
set backupskip=~/.local/share/vim/backup/*

set swapfile
set dir=~/.local/share/vim/swap

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

" Split navigation
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Use jj instead of escape
imap jj <Esc>

" Allow saving of files as sudo when it was forgotten
cmap w!! w !sudo tee > /dev/null %

" Disable Arrow keys in Escape mode
" CtrlP wont work well with this
"map <up> <nop>
"map <down> <nop>
"map <left> <nop>
"map <right> <nop>

" Disable Arrow keys in Insert mode
imap <up> <nop>
imap <down> <nop>
imap <left> <nop>
imap <right> <nop>

highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/

" Install vim-plug if missing
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Specify a directory for plugins
call plug#begin('~/.local/share/vim/plugged')

Plug 'NLKNguyen/papercolor-theme'
Plug 'bling/vim-airline'
Plug 'vim-syntastic/syntastic'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'tpope/vim-surround'
Plug 'Valloric/YouCompleteMe'
Plug 'glacambre/firenvim', { 'do': { _ -> firenvim#install(0) } }

call plug#end()

" Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:ycm_server_python_interpreter="/usr/bin/python2.7"
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" Theme
syntax on
set synmaxcol=800  " Highlight lines of at most 800 characters length
set background=dark
colorscheme PaperColor
" Transparency
"hi Normal guibg=NONE ctermbg=NONE
