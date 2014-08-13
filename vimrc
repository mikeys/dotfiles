set nocompatible

" Vundle Settings
" ===============
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" plugins
Plugin 'scrooloose/nerdtree.git'
Plugin 'scrooloose/nerdcommenter'

call vundle#end()            " required

" recognize filetype of files you open (required)
filetype plugin indent on


" Misc Settings
" ==================

" leader keys
let mapleader=","
let maplocalleader="\\"

" enable copy/paste to clipboard
set clipboard=unnamed

" recognize filetype of files you open
filetype plugin on

" syntax highlighting
syntax on

" indentation
set autoindent 		" automatically indents new line
set ts=4	        " number of spaces in a tab
set sw=4	        " number of spaces for indent
set et 		        " expand tabs into spaces

" prevent vim from adding empty line at the end of every file
set noeol
set binary


" Plugin Settings
" ==================

" NERDTree
" Ctrl-P to display the file browser tree
nmap <C-P> :NERDTreeToggle<CR>

" ,p to show current file in the tree
nmap <leader>p :NERDTreeFind<CR>

" NERDCommenter
let NERDCreateDefaultMappings=0 " disable default mappings
let NERDSpaceDelims=2           " place spaces after comment chars
let NERDDefaultNesting=0        " don't recomment commented lines

" ,/ to invert comment on the current line/selection
nmap <leader>/ <Plug>NERDCommenterToggle
vmap <leader>/ <Plug>NERDCommenterToggle