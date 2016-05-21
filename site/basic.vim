" ----------------------------------------
" Regular Vim Configuration (No Plugins Needed)
" ----------------------------------------

" Config {{{
set undofile
set swapfile              " Keep swapfiles
" }}}

" Behaviors {{{
filetype plugin indent on " Automatically detect file types. (must turn on after vundle etc)
set viewoptions=folds,options,cursor,unix,slash 
set virtualedit=onemore   " Allow for cursor beyond last character
set wildmode=list:longest " use emacs-style tab completion when selecting files, etc
set hidden                " Change buffer - without saving
set autowriteall          " Writes on make/shell commands
set history=1000          " Store a ton of history (default is 20)
" set spell                 " Spell checking on
set foldopen=block,hor,insert,jump,mark,percent,quickfix,search,tag,undo
" set foldmethod=syntax
" set foldenable            " Auto fold code
" set foldlevel=9
set formatoptions=crql
set iskeyword+=$,@,-      " Add extra characters that are valid parts of variables
set tags=./tags;/,tags;/
set nojoinspaces          " Prevents inserting two spaces after punctuation on a join (J)
set clipboard=unnamedplus " Yank to system/X Window clipboard
" }}}

" UI {{{
syntax on            " Syntax highlighting (must turn on after vundle etc)
set showmatch        " Show matching brackets.
set number           " Line numbers on
set nowrap           " Line wrapping off
set numberwidth=5
set encoding=utf-8
set guioptions=acg
set cmdheight=1      " Make the command area one line high
set splitright       " Puts new vsplit windows to the right of the current
set splitbelow       " Puts new split windows to the bottom of the current
set guicursor=n-v-c:block-Cursor-blinkon0,ve:ver35-Cursor,o:hor50-Cursor,i-ci:ver25-Cursor,r-cr:hor20-Cursor,sm:block-Cursor-blinkwait175-blinkoff150-blinkon175
set cursorline
set lazyredraw
if exists('+colorcolumn')
  set colorcolumn=80 " Color the 80th column differently
endif
" }}}

" Text Format {{{
set tabstop=2
set shiftwidth=2 " Tabs under smart indent
set autoindent   " Indent at the same level as the previous line
" set expandtab     " Tabs are spaces, not tabs
" }}}

" Searching {{{ 
set incsearch                   " Find as you type search
set hlsearch                    " Highlight search terms
set ignorecase
set smartcase                   " Non-case sensitive search
set wildmenu                    " Show list instead of just completing
set wildmode=list:longest,full  " Command <Tab> completion, list matches, then longest common part, then all.
set whichwrap=b,s,h,l,<,>,[,]   " Backspace and cursor keys wrap too
set wildignore+=.final_builds/*,*/tmp/*,*/node_modules/*,*.o,*.obj,*.exe,*.so,*.dll,*.pyc,.svn,.hg,.bzr,.git,.sass-cache,*.class,*.scssc,*/Godeps/*
if executable('ag')
  set grepprg=ag\ --nogroup\ --column\ --smart-case\ --nocolor\ --follow
  set grepformat=%f:%l:%c:%m
elseif executable('ack')
  set grepprg=ack\ --nogroup\ --column\ --smart-case\ --nocolor\ --follow\ $*
  set grepformat=%f:%l:%c:%m
endif
" }}}

" Visual {{{ 
set matchtime=2  " How many tenths of a second to blink 
" }}}

" Sounds {{{
set noerrorbells
set novisualbell
" }}}

" Mouse {{{
set mousehide    " Hide mouse after chars typed
set mouse=a      " Mouse in all modes
" }}}
