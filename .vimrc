" Tom's .vimrc
" Config file for Vim
" Borrowed some stuff from Matt Wozniski (mjw@drexel.edu)

"if version < 700
"endif

" In a terminal unless we're in a gui
let s:TERMINAL = ! has('gui_running')

"" Settings
set nocompatible            " Don't try to be vi compatible - be better.

""" Terminal Setup
if s:TERMINAL
    set ttyscroll=3           " Prefer redraw to scrolling for more than 3 lines
    set timeoutlen=700        " Wait 700 ms before timing out a mapping
    set ttimeoutlen=100       " and only 100 ms before timing out on a keypress
"   set mouse=a               " Allow mouse use in all modes
"   set ttymouse=xterm2       " Terminal sends modern xterm mouse reporting.
endif

set virtualedit=block       " Let cursor go past the last char in block mode
"set path=**,/usr/local/include,/usr/include

""" Searching and Patterns
set incsearch            " Incrementally search on /, don't wait for return
set hlsearch             " Highlight searches by default
set ignorecase           " Case insensitive search...
set smartcase            " ...unless uppercase letters are used in the search

""" Display
"set lazyredraw           " Don't repaint the screen while scripts are running
set scrolloff=3          " Keep 3 lines below and above the cursor
set background=dark

""" Windows
"set hidden                  " Hide any buffer not in a window

"""" Messages, Info, Status
set shortmess+=a            " Use [+] [RO] [w] for modified, read-only, modified
set showcmd                 " Display what command is waiting for an operator
set ruler                   " Show pos below the win if there's no status line
set laststatus=2            " Always show statusline, even if only 1 window
set report=0                " Notify me whenever any lines have changed
set vb t_vb=                " Disable visual bell!  I hate that flashing.

""" Editing
set backspace=2             " Backspace over autoindent, EOL, and BOL
set infercase               " Try to guess at case for insertions if not a match
set showmatch               " Briefly jump to the previous matching paren
set matchtime=2             " For .2 seconds
"set formatoptions+=n        " gq recognizes numbered lists, and will try to
"set formatoptions+=1        " break before, not after, a 1 letter word
set nowrap                  " Turn off word wrap

""" Coding
syntax on                   " Do syntax highlighting
set expandtab               " When I press tab, insert spaces
set shiftwidth=4            " Each tab is represented with 2 spaces for indents
set softtabstop=4           " As well as for pressing <TAB>
set ts=4
set tags=./tags;/home       " Tags file can be ./tags, ../tags, ..., /home/tags.
set showfulltag             " Show more information while completing tags
filetype plugin indent on   " Use filetype-specific indenting where available

""" Folding
set foldmethod=indent       " By default, use syntax to determine folds
"set foldcolumn=4
set foldlevelstart=99       " All folds open by default

""" Reading/Writing
set noautowrite             " This should be default, but I worry...

""" Command Line
set wildmenu                " Menu completion in command mode (ex: ":e <tab>")

""" Multi-byte
set encoding=utf-8

""" Autocommands
if has("autocmd")
    augroup vimrcEx
        au!
        au BufReadPost *
                    \ if line("'\"") > 0 && line("'\"") <= line("$") |
                    \   exe "normal g`\"" |
                    \ endif
        au BufReadPre *.txt setlocal ft=text
    augroup END
endif

" I'm sorry.  :(  Some Emacs bindings for the command window
cnoremap <C-A>     <Home>
cnoremap <ESC>b    <S-Left>
cnoremap <ESC>f    <S-Right>
cnoremap <ESC><BS> <C-W>

" Mappings
" <C-l> redraws the screen and removes any search highlighting.
nnoremap <silent> <C-n> :nohl<CR><C-l>

" ^h ^l ^j ^k switches splits
noremap <silent> <C-h> <C-w>h
noremap <silent> <C-l> <C-w>l
noremap <silent> <C-j> <C-w>j
noremap <silent> <C-k> <C-w>k

" Space toggles folds
noremap <silent> <S-f> za

" \s toggles spell checking
noremap <silent> <Leader>s :call ToggleSpell()<CR>
noremap <silent> <Leader>m :call SaveMake()<CR>

set clipboard=unnamed


nnoremap <F2> :set invpaste paste?<CR>
set pastetoggle=<F2>
set showmode

""" Functions
function! ToggleSpell()
    if &spell
        echo "Spell OFF"
        setlocal nospell
    else
        echo "Spell ON"
        setlocal spell spelllang=en_us
    endif
endfunction

function! SaveMake()
    echo "Saving..."
    write
    echo "Making..."
    make
endfunction

function! EatChar(pat)
    let c = nr2char(getchar(0))
    return (c =~ a:pat) ? '' : c
endfunc

set textwidth=78
set autoindent

colorscheme default
 
set listchars+=space:␣


