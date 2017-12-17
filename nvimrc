" Plugins
" =======
call plug#begin('~/.vim/plugged')

" Make sure you use single quotes
Plug 'bling/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" Plug 'rking/ag.vim'
" Plug 'Numkil/ag.nvim'
Plug 'Chiel92/vim-autoformat'
Plug 'qpkorr/vim-bufkill'
Plug 'ConradIrwin/vim-bracketed-paste'
Plug 'flazz/vim-colorschemes'
Plug 'editorconfig/editorconfig-vim'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'scrooloose/nerdcommenter'
Plug 'tpope/vim-surround'
Plug 'janko-m/vim-test'
Plug 'mikeys/vim-yaml'

" Syntax
Plug 'sheerun/vim-polyglot'
Plug 'Raimondi/delimitMate'   " Keep delimitMate before vim-endwise
Plug 'tpope/vim-endwise'
Plug 'benekastah/neomake'

" CTags
Plug 'majutsushi/tagbar'
" Plug 'xolox/vim-misc' | Plug 'xolox/vim-easytags'

" fzf
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'

" Nerdtree
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'

" Autocomplete
Plug 'Shougo/deoplete.nvim'
" Plug 'Shougo/context_filetype.vim'

" Git
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'mattn/webapi-vim' | Plug 'mattn/gist-vim'

" Go
Plug 'fatih/vim-go'
Plug 'zchee/deoplete-go', { 'do': 'make' }

" Tmux
Plug 'tmux-plugins/vim-tmux'
Plug 'christoomey/vim-tmux-navigator'
Plug 'benmills/vimux'

" Ruby
Plug 'tpope/vim-bundler'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-rake'
Plug 'vim-ruby/vim-ruby'

" JavaScript
Plug 'pangloss/vim-javascript'
Plug 'jelera/vim-javascript-syntax', { 'for': ['javascript', 'javascript.jsx'] }
Plug 'maksimr/vim-jsbeautify', { 'do': 'git submodule update --init --recursive' }
Plug 'mxw/vim-jsx'
Plug 'othree/javascript-libraries-syntax.vim'
Plug 'othree/jsdoc-syntax.vim'
Plug 'jaawerth/neomake-local-eslint-first'
Plug 'neovim/node-host'
" Plug 'bigfish/vim-js-context-coloring', { 'branch': 'neovim', 'do': 'npm install --update' }
Plug 'carlitux/deoplete-ternjs', { 'do': 'npm install -g tern' }

" HTML
Plug 'alvan/vim-closetag'
Plug 'mattn/emmet-vim'
Plug 'othree/html5.vim'
Plug 'gregsexton/MatchTag'
Plug 'skwp/vim-html-escape'

" Handlebars
Plug 'mustache/vim-mustache-handlebars'
Plug 'joukevandermaas/vim-ember-hbs'

" Sessions
Plug 'tpope/vim-obsession'
Plug 'dhruvasagar/vim-prosession'

" Themes
Plug 'w0ng/vim-hybrid'
Plug 'crusoexia/vim-monokai'
Plug 'Lokaltog/vim-distinguished'

" Order dependant plugins (after other plugins are loaded)
Plug 'jelera/vim-javascript-syntax'
Plug 'ryanoasis/vim-devicons'

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
let g:mapleader=","

" Disable Python 2 interpreter check
let g:python_host_skip_check=1


" vim user interface
" ==================

set so=999          " Make sure that coursor is always vertically centered
set colorcolumn=80  " add vertical lines on columns
set wildmenu        " Turn on the WiLd menu
set wildmode=list:longest,full " Set command-line completion mode
set wildignore=*.git,*.dll,*.o,*.obj,*.bak,*.exe,*.pyc,*.swp,*.jpg,*.gif,*.png " ignore formats
set cursorline      " Highlight current line - track cursor position more easily
set completeopt=longest,menuone " Completion options (select longest + show menu even if a single match is found)
set ruler           " Show line, column number, and relative position in the status line
set number          " Show line numbers - could be toggled on/off on-fly by pressing F6
set showcmd         " Show (partial) commands (or size of selection in visual mode) in the status line
set hidden          " Can change buffer without saving
set backspace=eol,start,indent " Configure backspace so it acts as it should act
set whichwrap+=<,>,h,l,[,] " Automatically wrap left and right
set mouse=a         " Enable mouse everywhere
set infercase       " Allow smarter completion by infering the case
set ignorecase      " Ignore case when searching
set smartcase       " When searching try to be smart about cases
set hlsearch        " Highlight search results
set incsearch       " Start search upon typing
set lazyredraw      " Don't redraw while executing macros (good performance config)
set magic           " For regular expressions turn magic on
set showmatch       " Show matching brackets when text indicator is over them
set mat=2           " How many tenths of a second to blink when matching brackets
set noerrorbells    " No annoying sound on errors
set novisualbell
set t_vb=
" set tm=100        " Timeout Len
set timeoutlen=1000
set ttimeoutlen=0
set foldcolumn=0    " Make sure that extra margin on left is removed
set numberwidth=4   " Number of columns for line numbers
set nrformats=octal,hex,alpha " Enable Ctrl-A/Ctrl-X on octal, hex and characters
set laststatus=2    " Always show the status line
set autoread


" Theme related
" =============

syntax on " Enable syntax highlighting

set t_Co=256
set background=dark
colorscheme hybrid

set encoding=utf8 " Set utf8 as standard encoding and en_US as the standard language

" highlight trailing space
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()

" Make sure that open and close tags are colored the same
highlight link xmlEndTag xmlTag
highlight link htmlEndTag htmlTag


" Text, tab and indent related
" ============================

set expandtab     " Use spaces instead of tabs
set tabstop=2     " number of spaces in a tab
set shiftwidth=2  " number of spaces for indent
set softtabstop=2
" set smarttab    " Be smart when using tabs ;)

" Linebreak on 500 characters
set linebreak
set textwidth=500

set autoindent    " Automatically indents new line
set nowrap        " Do not wrap words (view)

" Prevent vim from adding empty line at the end of every file
set noeol

" Return to last edit position when opening files
autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \   exe "normal! g`\"" |
     \ endif


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

nnoremap <A-x> <C-a>

" Fast close buffer (using vim buf-kill)
map <Leader>bd :BD<CR>

" Intuitively resize active pane
nnoremap <C-w>> :call SetWinAdjust('r', 10)<CR>
nnoremap <C-w>< :call SetWinAdjust('l', 10)<CR>

" Regenerate Tags
map <Leader>rt :call RegenerateCTags()<CR>

" Fast file saving
map <Leader>w :w<CR>
imap <Leader>w <ESC>:w<CR>
vmap <Leader>w <ESC><ESC>:w<CR>

" use CTRL-N like vim multiple cursors (select text under curosr and run cgn)
" map <C-n> viwy/<C-R>"<CR>Ncgn
" imap <C-n> <Esc>viwy/<C-R>"<CR>Ncgn

" Remap VIM 0 to first non-blank character
map 0 ^

" Force Filetype
" ===============
autocmd BufRead,BufNewFile .eslintrc setfiletype json
autocmd BufRead,BufNewFile .jshintrc setfiletype json
autocmd BufRead,BufNewFile .jsbeautifyrc setfiletype json


" Plugin Settings
" ===============

""" vim-airline
let g:airline_powerline_fonts = 1
let g:airline_theme =  'wombat'
let g:airline#extensions#tabline#show_tabs = 0
let g:airline#extensions#tabline#show_buffers = 0
let g:airline#extensions#tabline#show_tabs = 0
let g:airline#extensions#tabline#enabled = 1


""" vim-autoformat
noremap <F3> :Autoformat<CR><CR>


""" easytags
let g:easytags_async = 1
let g:easytags_auto_highlight = 0


""" fzf
let $FZF_DEFAULT_COMMAND = 'ag --hidden --ignore .git -l -g ""'

" find files (a-la ctrl-p)
nnoremap <silent> <expr> <leader>. (expand('%') =~ 'NERD_tree' ? "\<c-w>\<c-w>" : '').":Files\<cr>"
" find tags
nnoremap <silent> <expr> <leader>tt (expand('%') =~ 'NERD_tree' ? "\<c-w>\<c-w>" : '').":Tags\<cr>"
" find methods in current buffer
nnoremap <silent> <expr> <leader>fu (expand('%') =~ 'NERD_tree' ? "\<c-w>\<c-w>" : '').":BTags\<cr>"
" find buffers
nnoremap <silent> <expr> <leader>b (expand('%') =~ 'NERD_tree' ? "\<c-w>\<c-w>" : '').":Buffers\<cr>"

" let g:ctrlp_map = '<leader>,'
" let g:ctrlp_cmd = 'CtrlP'
" let g:ctrlp_working_path_mode = 'a'
" let g:ctrlp_working_path_mode = 'ra'
" let g:ctrlp_custom_ignore = {
     " \ 'dir':  '_build$\|deps$\|\.git$\|\.hg$\|\.svn$\|log$\|_public$\|node_modules$\|bower_components$\|tmp$\|vendor/bundle$\|vendor/cache$\|coverage$\|vendor/mongodb$\|vendor/redis$',
     " \ 'file': '\.swp$\|\.pyc$\|\.pyo$\|\.rbc$|\.rbo$\|\.class$\|\.o$\|\~$\',
     " \ }
" let g:ctrlp_clear_cache_on_exit = 1
" let g:ctrlp_max_height = 10
" let g:ctrlp_switch_buffer = 1 " jump to buffer in the same tab if already open
" let g:ctrlp_show_hidden = 1

" open multiple files with <c-z> to mark and <c-o> to open. v - opening in
" vertical splits; j - jump to first open buffer; r - open first in current buffer
" let g:ctrlp_open_multiple_files = 'vjr'

" let g:ctrlp_extensions = ['tag', 'buffertag', 'quickfix', 'mixed', 'line']"

" Use Ag over Grep
" if executable('ag')
  " set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  " let g:ctrlp_user_command = 'ag %s --ignore .git --ignore .gitkeep --hidden -l --nocolor -g  ""'

  " ag is fast enough that CtrlP doesn't need to cache
  " let g:ctrlp_use_caching = 0
" endif

" nmap <leader>. :CtrlPClearCache<cr>:CtrlP<cr>
" nmap <leader>m :CtrlPBufTag<cr>
" nmap <leader>M :CtrlPBufTagAll<cr>
" nmap <leader>l :CtrlPLine<cr>
" nmap <leader>b :CtrlPBuff<cr>


""" ctrlp-funky
" let g:ctrlp_funky_syntax_highlight = 1  " syntax highlighting on funky matches
" let g:ctrlp_funky_matchtype = 'path'  " matched chars highlighting

" noremap <Leader>fu :CtrlPFunky<Cr>
" narrow the list down with a word under cursor
" nnoremap <Leader>fU :execute 'CtrlPFunky ' . expand('<cword>')<Cr>nn


""" vim-go
" Disable opening browser after posting to your snippet to play.golang.org:
let g:go_fmt_command = "goimports"
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
let g:go_metalinter_enabled = []
let g:go_metalinter_autosave_enabled = []


""" deoplete-go
let g:deoplete#sources#go#gocode_binary = $GOPATH.'/bin/gocode'
let g:deoplete#sources#go#sort_class = ['package', 'func', 'type', 'var', 'const']
let g:deoplete#sources#go#pointer = 1
let g:deoplete#sources#go#package_dot = 1


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
" autocmd VimEnter * if !argc() | NERDTree | endif

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


""" Polyglot
let g:polyglot_disabled = ['css', 'javascript', 'html', 'javascript.jsx']


""" delimitMate
let delimitMate_excluded_ft = "html"
let delimitMate_expand_cr = 1


""" Neomake
let g:neomake_open_list=2
let g:neomake_warning_sign = {
      \ 'text': '✹',
      \ 'texthl': 'WarningMsg',
      \ }

let g:neomake_error_sign = {
      \ 'text': '✖',
      \ 'texthl': 'ErrorMsg',
      \ }

let g:neomake_javascript_enabled_makers = ['eslint']
let g:neomake_ruby_enabled_makers = []
let g:neomake_go_enabled_makers = [ 'go', 'gometalinter' ]
let g:neomake_go_gometalinter_maker = {
  \ 'args': [
  \   '--tests',
  \   '--enable-gc',
  \   '--concurrency=3',
  \   '--fast',
  \   '-D', 'aligncheck',
  \   '-D', 'dupl',
  \   '-D', 'gocyclo',
  \   '-D', 'gotype',
  \   '-E', 'errcheck',
  \   '-E', 'misspell',
  \   '-E', 'unused',
  \   '%:p:h',
  \ ],
  \ 'append_file': 0,
  \ 'errorformat':
  \   '%E%f:%l:%c:%trror: %m,' .
  \   '%W%f:%l:%c:%tarning: %m,' .
  \   '%E%f:%l::%trror: %m,' .
  \   '%W%f:%l::%tarning: %m'
  \ }

if exists('g:plugs["neomake"]')
  if has('autocmd')
    autocmd! BufWritePost * Neomake
  endif
endif


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


""" Autocomplete

" Deoplete
set omnifunc=syntaxcomplete#Complete
let g:deoplete#enable_at_startup = 1

let g:deoplete#omni#input_patterns = {}
" let g:deoplete#omni#input_patterns.html = '<[^>]*'
let g:deoplete#omni#input_patterns.css = '^\s+\w+|\w+[):;](\s+)?|[@!]'
let g:deoplete#omni#input_patterns.scss = '^\s+\w+|\w+[):;](\s+)?|[@!]'

autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif

let g:deoplete#enable_smart_case = 1
let g:deoplete#auto_completion_start_length = 1  " Set minimum syntax keyword length.

inoremap <silent><expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <silent><expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" Disable AutoComplPop.
let g:acp_enableAtStartup = 0

" Enable omni completion.
autocmd FileType javascript,javascript.jsx setlocal omnifunc=tern#Complete
" autocmd FileType html,html.handlebars,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS noci
autocmd FileType css,scss set iskeyword=@,48-57,_,-,?,!,192-255
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags


""" vim-timux-navigator
" Workaround for annoying problem with C-h not working with neovim
nmap <BS> :<C-u>TmuxNavigateLeft<CR>


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
autocmd FileType javascript noremap <buffer> <c-f> :call JsBeautify()<cr>
autocmd FileType json noremap <buffer> <c-f> :call JsonBeautify()<cr>
autocmd FileType jsx noremap <buffer> <c-f> :call JsxBeautify()<cr>
autocmd FileType html noremap <buffer> <c-f> :call HtmlBeautify()<cr>
autocmd FileType css noremap <buffer> <c-f> :call CSSBeautify()<cr>

" Format selection (visual mode)
autocmd FileType javascript vnoremap <buffer> <c-f> :call RangeJsBeautify()<cr>
autocmd FileType json vnoremap <buffer> <c-f> :call RangeJsonBeautify()<cr>
autocmd FileType jsx vnoremap <buffer> <c-f> :call RangeJsxBeautify()<cr>
autocmd FileType html vnoremap <buffer> <c-f> :call RangeHtmlBeautify()<cr>
autocmd FileType css vnoremap <buffer> <c-f> :call RangeCSSBeautify()<cr>


""" vim-jsx
let g:jsx_ext_required = 1


""" javascript-libraries-syntax.vim
let g:used_javascript_libs = 'jquery,underscore,react'


""" tern_for_vim
let g:tern_request_timeout = 1
let g:tern_map_prefix = '<leader>'
let g:tern_map_keys = 1
let g:tern_show_argument_hints='on_hold'


""" closetag.vim
let g:closetag_filenames = "*.html,*.hbs"


""" vim-mustache-handlebars
let g:mustache_abbreviations = 1


""" WebDevIcons
let g:WebDevIconsUnicodeDecorateFolderNodes = 1
let g:DevIconsEnableFoldersOpenClose = 1


" Helper Functions
" ================

" Search for what is currently selected in visual mode
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

" Create parent directories on save, if they do not exist
function s:MkNonExDir(file, buf)
    if empty(getbufvar(a:buf, '&buftype')) && a:file!~#'\v^\w+\:\/'
        let dir=fnamemodify(a:file, ':h')
        if !isdirectory(dir)
            call mkdir(dir, 'p')
        endif
    endif
endfunction
augroup BWCCreateDir
    autocmd!
    autocmd BufWritePre * :call s:MkNonExDir(expand('<afile>'), +expand('<abuf>'))
augroup END

" Change from block cursor to pipe cursor on insert mode
let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1

" Intuitively resize active pane
fun! SetWinAdjust(direction, interval)
  if winnr() == winnr('$')
    let resize_by = (a:direction == 'r' ? '-' : '+') . a:interval
  else
    let resize_by = (a:direction == 'r' ? '+' : '-') . a:interval
  endif

  execute 'vertical resize ' . resize_by
endfun


" Ruby rules fix based on rubocop
function! RubFix(aggressive,args)
  let args = split(a:args,' ')
  if (!empty(getbufvar(winbufnr('%'), "&bt")))
    echo 'not a file buffer'
    return 'not a file buffer'
  endif
  let cmd = 'rubocop -a'
  if a:aggressive!='!'
    if empty(args)
      let styles  = ["Style/LeadingCommentSpace","Style/SpaceAfterColon","Style/SpaceAfterComma","Style/SpaceAfterMethodName","Style/SpaceAroundBlockParameters",
            \ "Style/SpaceAroundEqualsInParameterDefault","Style/SpaceAroundKeyword","Style/SpaceAroundOperators","Style/SpaceBeforeBlockBraces",
            \ "Style/SpaceBeforeComma","Style/SpaceBeforeComment","Style/SpaceBeforeFirstArg","Style/SpaceBeforeSemicolon","Style/SpaceInsideBlockBraces",
            \ "Style/SpaceInsideBrackets","Style/SpaceInsideHashLiteralBraces","Style/SpaceInsideParens","Style/SpaceInsidePercentLiteralDelimiters",
            \ "Style/SpaceInsideRangeLiteral","Style/EmptyLineAfterMagicComment","Style/EmptyLineBetweenDefs","Style/EmptyLines",
            \ "Style/EmptyLinesAroundAccessModifier","Style/EmptyLinesAroundBlockBody","Style/EmptyLinesAroundClassBody","Style/EmptyLinesAroundExceptionHandlingKeywords",
            \ "Style/EmptyLinesAroundMethodBody","Style/EmptyLinesAroundModuleBody", "Style/TrailingCommaInLiteral", "Style/TrailingCommaInArguments",
            \ "Style/TrailingUnderscoreVariable", "Style/TrailingWhitespace" , "Style/TrailingBlankLines", "Style/ExtraSpacing"
            \ ]
    else
      let styles = []
      for command in args
        if command=='setup' || command=='init'
          let rubocop_files_count = system('ls -l .rubocop.yml | wc -l')
          if rubocop_files_count =~ '\w*0\w*'
            call system('echo "\nAllCops:\n  DisplayCopNames: true\n" > .rubocop.yml')
          else
            let rubocop_content = system('cat .rubocop.yml')
            if rubocop_content !~ '\w*DisplayCopNames:\w*'
              call system('echo "\nAllCops:\n  DisplayCopNames: true\n" >> .rubocop.yml')
            else
              echo 'rubocop.yml already contains init rules'
            endif
          end
          return
        elseif command=='ignore' || command=='add'
          let line_errors = s:rubocop_line_errors()
          if !empty(line_errors) 
            for err in line_errors
              let rubocop_rule = split(err['text'],':')[0]
              if rubocop_rule =~ '^Style\/'
                call system('echo "\n'.rubocop_rule.':\n  Enabled: false\n" >> .rubocop.yml')
                echo "Style rule added to .rubocop.yml"
              elseif rubocop_rule =~ '^Lint\/'
                call system('echo "\n'.rubocop_rule.':\n  Enabled: false\n" >> .rubocop.yml')
                echo "Lint rule added to .rubocop.yml"
              elseif rubocop_rule =~ '^Metrics\/'
                "let rule_value = matchstr(err['text'], '\[[0-9]\+')
                call system('echo "\n'.rubocop_rule.':\n  Enabled: false\n" >> .rubocop.yml')
                echo "Metric rule added to .rubocop.yml"
              else
                echo "don't know how to parse the rule"
              end
            endfor
          endif
          execute 'w'
          return
        end
        if command=='error' || command=='err' || command=='this' || command=='current' " get current line errors
          let line_errors = s:rubocop_line_errors()
          if !empty(line_errors) 
            for err in line_errors
              let rubocop_rule = split(err['text'],':')[0]
              call add(styles,rubocop_rule)
            endfor
          endif
        else
          call add(styles,command)
        end
      endfor
    endif
    if empty(styles)
      echo "didn't find rubucop errors on current line"
      return 
    endif
    let cmd = cmd.' --only '.join(styles,',')
  endif

  let cmd = cmd.' '.expand('%:pj')
  execute 'w'
  " echo cmd
  let resp = system(cmd)
  " echo resp
  edit!
  execute 'w'
endfunction
command! -bang -nargs=* RubFix call RubFix('<bang>', <q-args>)
function! JsonFormat()
 execute '%!python -m json.tool'
endfunction
command! JsonFormat call JsonFormat() 

function! RegenerateCTags()
  if !exists("g:ctags_regenerate_args")
    let g:ctags_regenerate_args = ''
  endif

  let cmd = 'ctags --exclude=log --exclude=tmp --exclude=node_modules '. g:ctags_regenerate_args.' --exclude=.\* --extra=+f -R * '
  echo cmd
  let resp = system(cmd)
  echo resp
  echo "DONE !"
endfunction
