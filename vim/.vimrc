set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" " alternatively, pass a path where Vundle should install plugins
" "call vundle#begin('~/some/path/here')

" " let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'wincent/command-t'
Plugin 'sickill/vim-monokai'
Plugin 'fatih/vim-go'
Plugin 'Shougo/neocomplete.vim'
Plugin 'tpope/vim-surround'

" " All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" " To ignore plugin indent changes, instead use:
" "filetype plugin on

" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just
" :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to
" auto-approve removal

" see :h vundle for more details or wiki for FAQ

syntax on
set number
set ruler
set mouse=a
set clipboard=unnamed

set tabstop=4       " The width of a TAB is set to 4.
                    " Still it is a \t. It is just that
										" Vim will interpret it to be having
										" a width of 4.
set shiftwidth=4		"Indents will have a width of 4
set softtabstop=4		"Sets the number of columns for a TAB
set expandtab			"replace tabs with spaces
set smartindent	
set nu
set nowrap
set smartcase
set noswapfile
set incsearch
set mps+=<:>

colorscheme monokai

let g:CommandTWildIgnore=&wildignore . ",*/bin,**/bower_components/*,**/node_modules/*"
