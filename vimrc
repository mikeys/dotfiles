" Plugins
" =======
call plug#begin('~/.vim/plugged')

" Make sure you use single quotes
Plug 'bling/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'rking/ag.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'Chiel92/vim-autoformat'
Plug 'qpkorr/vim-bufkill'
Plug 'ConradIrwin/vim-bracketed-paste'
Plug 'flazz/vim-colorschemes'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'tacahiroy/ctrlp-funky'
Plug 'editorconfig/editorconfig-vim'
Plug 'mattn/emmet-vim'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'fatih/vim-go'
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/nerdcommenter'
Plug 'tpope/vim-surround'
Plug 'scrooloose/syntastic'
Plug 'majutsushi/tagbar'
Plug 'janko-m/vim-test'
Plug 'mikeys/vim-yaml'
Plug 'Valloric/YouCompleteMe', { 'do': './install.py' }

" Themes
Plug 'tomasr/molokai'
Plug 'w0ng/vim-hybrid'

" Tmux Plugins
Plug 'tmux-plugins/vim-tmux'
Plug 'christoomey/vim-tmux-navigator'
Plug 'benmills/vimux'

" Ruby Plugins
Plug 'vim-ruby/vim-ruby'

" JS Plugins
Plug 'pangloss/vim-javascript'
Plug 'maksimr/vim-jsbeautify', { 'do': 'git submodule update --init --recursive' }
Plug 'mxw/vim-jsx'
Plug 'marijnh/tern_for_vim', { 'do': 'npm install' }

" Add plugins to &runtimepath
call plug#end()


" General
" =======

" Use vim settings, rather then vi settings
set nocompatible

set history=1000 " Sets how many lines of history VIM has to remember

" enable copy/paste to clipboard
set clipboard=unnamed

" Recognize filetype of files you open (required)
filetype plugin on
filetype indent on

" Use Unix as the standard file type
set ffs=unix,dos,mac

" Turn backup off, since most stuff is in Git anyways
set nobackup
set nowritebackup
set noswapfile

" With a map leader it's possible to do extra key combinations
" like <leader>w saves the current file
let mapleader=","
let g:mapleader = ","


" vim user interface
" ==================

set so=999 			" Make sure that coursor is always vertically centered
set colorcolumn=80 	" add vertical lines on columns
set wildmenu 		" Turn on the WiLd menu
set wildmode=list:longest,full " Set command-line completion mode
set wildignore=*.git,*.dll,*.o,*.obj,*.bak,*.exe,*.pyc,*.swp,*.jpg,*.gif,*.png " ignore formats
set cursorline 		" Highlight current line - track cursor position more easily
set completeopt=longest,menuone " Completion options (select longest + show menu even if a single match is found)
set ruler 			" Show line, column number, and relative position in the status line
set number 			" Show line numbers - could be toggled on/off on-fly by pressing F6
set showcmd 		" Show (partial) commands (or size of selection in visual mode) in the status line
set hidden 			" Can change buffer without saving
set backspace=eol,start,indent " Configure backspace so it acts as it should act
set whichwrap+=<,>,h,l,[,] " Automatically wrap left and right
set mouse=a			" Enable mouse everywhere
set infercase 		" Allow smarter completion by infering the case
set ignorecase 		" Ignore case when searching
set smartcase 		" When searching try to be smart about cases
set hlsearch 		" Highlight search results
set incsearch 		" Start search upon typing
set lazyredraw 		" Don't redraw while executing macros (good performance config)
set magic 			" For regular expressions turn magic on
set showmatch 		" Show matching brackets when text indicator is over them
set mat=2 			" How many tenths of a second to blink when matching brackets
set noerrorbells 	" No annoying sound on errors
set novisualbell
set t_vb=
set tm=500 			" Timeout Len
set foldcolumn=0 	" Make sure that extra margin on left is removed
set numberwidth=4 	" Number of columns for line numbers
set nrformats=octal,hex,alpha " Enable Ctrl-A/Ctrl-X on octal, hex and characters
set laststatus=2 	" Always show the status line


" Theme related
" =============

syntax on " Enable syntax highlighting

set t_Co=256
set background=dark
let g:hybrid_custom_term_colors = 1
colorscheme hybrid

set encoding=utf8 " Set utf8 as standard encoding and en_US as the standard language

" highlight trailing space
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()


" Text, tab and indent related
" ============================

set expandtab 	" Use spaces instead of tabs
set smarttab 	" Be smart when using tabs ;)
set tabstop=2	" number of spaces in a tab
set shiftwidth=2 " number of spaces for indent

" Linebreak on 500 characters
set linebreak
set textwidth=500

set autoindent 	" Automatically indents new line
set nowrap		" Do not wrap words (view)

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

" Fast close buffer (using vim buf-kill)
map <Leader>bd :BD<CR>

" Fast saving
map <Leader>w :w<CR>
imap <Leader>w <ESC>:w<CR>
vmap <Leader>w <ESC><ESC>:w<CR>

" Remap VIM 0 to first non-blank character
map 0 ^


" Plugin Settings
" ===============

""" vim-airline
let g:airline_powerline_fonts = 1
let g:airline_theme =  'wombat'
let g:airline#extensions#tabline#enabled = 1


""" vim-autoformat
noremap <F3> :Autoformat<CR><CR>


""" ctrlp
let g:ctrlp_map = '<leader>,'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_custom_ignore = {
     \ 'dir':  '_build$\|deps$\|\.git$\|\.hg$\|\.svn$\|log$\|_public$\|node_modules$\|bower_components$\|tmp$\|vendor/bundle$\|vendor/cache$\|coverage$\|vendor/mongodb$\|vendor/redis$',
     \ 'file': '\.swp$\|\.pyc$\|\.pyo$\|\.rbc$|\.rbo$\|\.class$\|\.o$\|\~$\',
     \ }
let g:ctrlp_clear_cache_on_exit = 1
let g:ctrlp_max_height = 10
let g:ctrlp_switch_buffer = 1 " jump to buffer in the same tab if already open
let g:ctrlp_show_hidden = 1

" open multiple files with <c-z> to mark and <c-o> to open. v - opening in
" vertical splits; j - jump to first open buffer; r - open first in current buffer
let g:ctrlp_open_multiple_files = 'vjr'

let g:ctrlp_extensions = ['tag', 'buffertag', 'quickfix', 'mixed', 'line']"

" ctrlp leaves stale caches behind if there is another vim process runnin
" which didn't use ctrlp. so we clear all caches on each new vim invocation
cal ctrlp#clra()

" Use Ag over Grep
if executable('ag')
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif

nmap <leader>. :CtrlPClearCache<cr>:CtrlP<cr>
nmap <leader>m :CtrlPBufTag<cr>
nmap <leader>M :CtrlPBufTagAll<cr>
" nmap <leader>l :CtrlPLine<cr>
" nmap <leader>b :CtrlPBuff<cr>


""" ctrlp-funky
let g:ctrlp_funky_syntax_highlight = 1 	" syntax highlighting on funky matches
let g:ctrlp_funky_matchtype = 'path' 	" matched chars highlighting

noremap <Leader>fu :CtrlPFunky<Cr>
" narrow the list down with a word under cursor
nnoremap <Leader>fU :execute 'CtrlPFunky ' . expand('<cword>')<Cr>nn


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


""" Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_aggregate_errors = 1
let g:syntastic_always_populate_loc_list = 0
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_javascript_checkers = ['eslint']

""" tagbar
nmap <F8> :TagbarToggle<CR>

" Go support
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


""" YouCompleteMe
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0

" Enable omni completion.
" autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
" autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
" autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
" autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=tern#Complete


""" vimux
let g:VimuxHeight = "40"
let g:VimuxOrientation = 'v'
map <Leader>vp :VimuxPromptCommand<CR>
map <Leader>vq :VimuxCloseRunner<CR>
map <Leader>vl :VimuxRunLastCommand<CR>
map <Leader>vz :VimuxZoomRunner<CR>

""" vim-test
let g:test#strategy = 'vimux'
nmap <silent> <leader>t :TestNearest<CR>
nmap <silent> <leader>T :TestFile<CR>
nmap <silent> <leader>a :TestSuite<CR>
" nmap <silent> <leader>l :TestLast<CR>
nmap <silent> <leader>g :TestVisit<CR>


""" vim-jsbeautify
autocmd FileType javascript noremap <buffer>  <c-f> :call JsBeautify()<cr>
autocmd FileType json noremap <buffer> <c-f> :call JsonBeautify()<cr>
autocmd FileType jsx noremap <buffer> <c-f> :call JsxBeautify()<cr>
autocmd FileType html noremap <buffer> <c-f> :call HtmlBeautify()<cr>
autocmd FileType css noremap <buffer> <c-f> :call CSSBeautify()<cr>

" Format selection (visual mode)
autocmd FileType javascript vnoremap <buffer>  <c-f> :call RangeJsBeautify()<cr>
autocmd FileType json vnoremap <buffer> <c-f> :call RangeJsonBeautify()<cr>
autocmd FileType jsx vnoremap <buffer> <c-f> :call RangeJsxBeautify()<cr>
autocmd FileType html vnoremap <buffer> <c-f> :call RangeHtmlBeautify()<cr>
autocmd FileType css vnoremap <buffer> <c-f> :call RangeCSSBeautify()<cr>


""" tern_for_vim
let g:tern_map_prefix = '<leader>'
let g:tern_map_keys = 1
let g:tern_show_argument_hints='on_hold'


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