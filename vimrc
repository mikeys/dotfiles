" General
" =======

" Use vim settings, rather then vi settings
set nocompatible

" Sets how many lines of history VIM has to remember
set history=700

" enable copy/paste to clipboard
set clipboard=unnamed


" Vundle Settings
" ===============
call plug#begin('~/.vim/plugged')

" Make sure you use single quotes
Plug 'bling/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'rking/ag.vim'
Plug 'Chiel92/vim-autoformat'
Plug 'jiangmiao/auto-pairs'
Plug 'flazz/vim-colorschemes'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'editorconfig/editorconfig-vim'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'fatih/vim-go'
Plug 'Yggdroot/indentLine'
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/nerdcommenter'
Plug 'vim-ruby/vim-ruby'
Plug 'tpope/vim-surround'
Plug 'scrooloose/syntastic'
Plug 'majutsushi/tagbar'
Plug 'tmux-plugins/vim-tmux'
Plug 'Valloric/YouCompleteMe', { 'do': './install.py' }

"" JS Plugins
Plug 'marijnh/tern_for_vim', { 'do': 'npm install' }
Plug 'pangloss/vim-javascript'
Plug 'millermedeiros/vim-esformatter'
Plug 'mxw/vim-jsx'

" Add plugins to &runtimepath
call plug#end()

" Recognize filetype of files you open (required)
filetype plugin on
filetype indent on

" With a map leader it's possible to do extra key combinations
" like <leader>w saves the current file
let mapleader=","
let g:mapleader = ","

" Fast saving
map <Leader>w :w<CR>
imap <Leader>w <ESC>:w<CR>
vmap <Leader>w <ESC><ESC>:w<CR>


" ==================
" VIM User Interface
" ==================

" Make sure that coursor is always vertically centered on j/k moves
set so=999

" add vertical lines on columns
set colorcolumn=80

" Turn on the WiLd menu
set wildmenu

" Set command-line completion mode
set wildmode=list:longest,full

" Highlight current line - allows you to track cursor position more easily
set cursorline

" Completion options (select longest + show menu even if a single match is found)
set completeopt=longest,menuone

" Ignore compiled files
set wildignore=*.o,*~,*.pyc
if has("win16") || has("win32")
    set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store
else
    set wildignore+=.git\*,.hg\*,.svn\*
endif

" Show line, column number, and relative position within a file in the status line
set ruler

" Show line numbers - could be toggled on/off on-fly by pressing F6
set number

" Show (partial) commands (or size of selection in Visual mode) in the status line
set showcmd

" A buffer becomes hidden when it is abandoned
set hidden

" Configure backspace so it acts as it should act
set backspace=eol,start,indent

" Automatically wrap left and right
set whichwrap+=<,>,h,l,[,]

" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
  set mouse=a
endif

" Allow smarter completion by infering the case
set infercase

" Ignore case when searching
set ignorecase

" When searching try to be smart about cases
set smartcase

" Highlight search results
set hlsearch

" Makes search act like search in modern browsers
set incsearch

" Don't redraw while executing macros (good performance config)
set lazyredraw

" For regular expressions turn magic on
set magic

" Show matching brackets when text indicator is over them
set showmatch

" How many tenths of a second to blink when matching brackets
set mat=2

" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=

" Timeout Len
set tm=500

" Make sure that extra margin on left is removed
set foldcolumn=0

" Enable Ctrl-A/Ctrl-X to work on octal and hex numbers, as well as characters
set nrformats=octal,hex,alpha

" Number of columns for line numbers
set numberwidth=5

" Always show the status line
set laststatus=2


" Colors and Fonts
" ================

" Enable syntax highlighting
syntax enable

set t_Co=256

" colorscheme grb256
set background=dark
colorscheme molokai

" Set extra options when running in GUI mode
if has("gui_running")
    set guioptions-=T
    set guioptions-=e
    set guitablabel=%M\ %t
endif

" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf8

" Use Unix as the standard file type
set ffs=unix,dos,mac

" highlight trailing space
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()


" Files, backups and undo
" =======================

" Turn backup off, since most stuff is in Git anyways
set nobackup
set nowritebackup
set noswapfile


" Text, tab and indent related
" ============================

" Use spaces instead of tabs
set expandtab

" Be smart when using tabs ;)
set smarttab

" 1 tab == 4 spaces
set tabstop=4        " number of spaces in a tab
set shiftwidth=4     " number of spaces for indent

" Linebreak on 500 characters
set linebreak
set textwidth=500

set autoindent       " Automatically indents new line
set nowrap           " Do not wrap words (view)

" Prevent vim from adding empty line at the end of every file
set noeol
set binary

" Return to last edit position when opening files
autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \   exe "normal! g`\"" |
     \ endif

" Remember info about open buffers on close
set viminfo^=%


" Editing mappings
" ================

" Visual mode pressing * or # searches for the current selection
" Super useful! From an idea by Michael Naumann
vnoremap <silent> * :call VisualSelection('f', '')<CR>
vnoremap <silent> # :call VisualSelection('b', '')<CR>

" Visual shifting (does not exit Visual mode)
vnoremap < <gv
vnoremap > >gv

" cycle through buffers
nnoremap <C-n> :bnext<CR>
nnoremap <C-p> :bprevious<CR>

" Remap VIM 0 to first non-blank character
map 0 ^


" ===============
" Plugin Settings
" ===============

""" NERDTree
" General properties
let NERDTreeDirArrows=1
let NERDTreeMinimalUI=1
let NERDTreeIgnore=['\.o$', '\.pyc$', '\.php\~$']
let NERDTreeWinSize = 35

" Make sure that when NT root is changed, Vim's pwd is also updated
let NERDTreeChDirMode = 2
let NERDTreeShowLineNumbers = 1
let NERDTreeAutoCenter = 1

" Open NERDTree on startup, when no file has been specified
autocmd VimEnter * if !argc() | NERDTree | endif

" Toggle On/Off
nnoremap <C-k><C-b> :NERDTreeToggle<CR>

" ,p to show current file in the tree
nmap <leader>p :NERDTreeFind<CR>


""" NERDCommenter
let NERDCreateDefaultMappings=0  " disable default mappings
let NERDSpaceDelims=2            " place spaces after comment chars
let NERDDefaultNesting=0         " don't recomment commented lines

" ,/ to invert comment on the current line/selection
nmap <leader>/ <Plug>NERDCommenterToggle
vmap <leader>/ <Plug>NERDCommenterToggle


""" Ctrl-P
let g:ctrlp_map = '<leader>,'
let g:ctrlp_cmd = 'CtrlP'

nmap <leader>. :CtrlPClearCache<cr>:CtrlP<cr>
nmap <leader>l :CtrlPLine<cr>
nmap <leader>b :CtrlPBuff<cr>
nmap <leader>m :CtrlPBufTag<cr>
nmap <leader>M :CtrlPBufTagAll<cr>

let g:ctrlp_clear_cache_on_exit = 1
" ctrlp leaves stale caches behind if there is another vim process runnin
" which didn't use ctrlp. so we clear all caches on each new vim invocation
cal ctrlp#clra()

let g:ctrlp_max_height = 40

" jump to buffer in the same tab if already open
let g:ctrlp_switch_buffer = 1

" if in git repo - use git file listing command, should be faster
if executable('ag')
  " Use Ag over Grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
else
  let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files --exclude-standard -cod']
endif

" open multiple files with <c-z> to mark and <c-o> to open. v - opening in
" vertical splits; j - jump to first open buffer; r - open first in current buffer
let g:ctrlp_open_multiple_files = 'vjr'

let g:ctrlp_extensions = ['tag', 'buffertag', 'quickfix', 'mixed', 'line']"


""" Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_aggregate_errors = 1
let g:syntastic_always_populate_loc_list = 0
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0


""" vim-go
" Disable opening browser after posting to your snippet to play.golang.org:
let g:go_fmt_fail_silently = 1

" Show a list of interfaces which is implemented by the type under your cursor
au FileType go nmap <Leader>s <Plug>(go-implements)

" Show type info for the word under your cursor
au FileType go nmap <Leader>i <Plug>(go-info)

" Open the relevant Godoc for the word under the cursor
au FileType go nmap <Leader>gd <Plug>(go-doc)
au FileType go nmap <Leader>gv <Plug>(go-doc-vertical)

" Open the Godoc in browser
au FileType go nmap <Leader>gb <Plug>(go-doc-browser)

" Run/build/test/coverage
au FileType go nmap <leader>r <Plug>(go-run)
au FileType go nmap <leader>b <Plug>(go-build)
au FileType go nmap <leader>t <Plug>(go-test)
au FileType go nmap <leader>c <Plug>(go-coverage)

" By default syntax-highlighting for Functions, Methods and Structs is disabled.
" Let's enable them!
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1

nmap <F8> :TagbarToggle<CR>
let g:tagbar_type_go = {
    \ 'ctagstype' : 'go',
    \ 'kinds'     : [
        \ 'p:package',
        \ 'i:imports:1',
        \ 'c:constants',
        \ 'v:variables',
        \ 't:types',
        \ 'n:interfaces',
        \ 'w:fields',
        \ 'e:embedded',
        \ 'm:methods',
        \ 'r:constructor',
        \ 'f:functions'
    \ ],
    \ 'sro' : '.',
    \ 'kind2scope' : {
        \ 't' : 'ctype',
        \ 'n' : 'ntype'
    \ },
    \ 'scope2kind' : {
        \ 'ctype' : 't',
        \ 'ntype' : 'n'
    \ },
    \ 'ctagsbin'  : 'gotags',
    \ 'ctagsargs' : '-sort -silent'
\ }


""" vim-autoformat
noremap <F3> :Autoformat<CR><CR>


""" tagbar
nmap <F8> :TagbarToggle<CR>
let g:tagbar_type_go = {
    \ 'ctagstype' : 'go',
    \ 'kinds'    : [
        \ 'p:package',
        \ 'i:imports:1',
        \ 'c:constants',
        \ 'v:variables',
        \ 't:types',
        \ 'n:interfaces',
        \ 'w:fields',
        \ 'e:embedded',
        \ 'm:methods',
        \ 'r:constructor',
        \ 'f:functions'
    \ ],
    \ 'sro' : '.',
    \ 'kind2scope' : {
        \ 't' : 'ctype',
        \ 'n' : 'ntype'
    \ },
    \ 'scope2kind' : {
        \ 'ctype' : 't',
        \ 'ntype' : 'n'
    \ },
    \ 'ctagsbin'  : 'gotags',
    \ 'ctagsargs' : '-sort -silent'
\ }


""" vim-airline
let g:airline_powerline_fonts = 1
let g:airline_theme =  'wombat'
let g:airline#extensions#tabline#enabled = 1


""" YouCompleteMe
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0

" Enable omni completion.
" autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
" autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
"autocmd FileType javascript setlocal omnifunc=tern#Complete
" autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
" autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
" autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
"
autocmd FileType javascript setlocal omnifunc=tern#Complete


" ================
" Helper Functions
" ================
function! VisualSelection(direction, extra_filter) range
    let l:saved_reg = @"
    execute "normal! vgvy"

    let l:pattern = escape(@", '\\/.*$^~[]')
    let l:pattern = substitute(l:pattern, "\n$", "", "")

    if a:direction == 'b'
        execute "normal ?" . l:pattern . "^M"
    elseif a:direction == 'gv'
        call CmdLine("Ack \"" . l:pattern . "\" " )
    elseif a:direction == 'replace'
        call CmdLine("%s" . '/'. l:pattern . '/')
    elseif a:direction == 'f'
        execute "normal /" . l:pattern . "^M"
    endif

    let @/ = l:pattern
    let @" = l:saved_reg
endfunction