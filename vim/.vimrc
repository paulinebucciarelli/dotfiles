" Plugin Management
set nocompatible              " be iMproved, required
filetype off                  " required
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" linter
Plugin 'w0rp/ale'

" themes
Plugin 'sonph/onehalf', {'rtp': 'vim/'}

" All of your Plugins must be added before the following line
call vundle#end()            " required
" allow plugin and syntax again
filetype plugin indent on    " required


"""""""""""""""""""""""""""""""
"         APPEARANCE          "
"""""""""""""""""""""""""""""""
syntax on
set background=dark
colorscheme onehalfdark

set list	" show invisible characters
set listchars=tab:»\ ,extends:›,precedes:‹,nbsp:·,trail:·

set relativenumber number	" Show line numbers
set showbreak=+++	" Wrap-broken line prefix
"set textwidth=100	" Line wrap (number of cols)
set showmatch	" Highlight matching brace
" Search within search if visual selection
vnoremap / <Esc>/\%><C-R>=line("'<")-1<CR>l\%<<C-R>=line("'>")+1<CR>l
set hlsearch	" Highlight all search results
set smartcase	" Enable smart-case search
set ignorecase	" Always case-insensitive
set incsearch	" Searches for strings incrementally
set wrapscan	" Searches wrap around end of file
" Disable highlight when <leader><cr> is pressed
map <silent> <leader><cr> :noh<cr>

" Set leader to be ',' as '/' is hard to reach on EU keyboards
let mapleader=","

set mouse=a	" Allow mouse
set autoindent	" Auto-indent new lines
set smarttab	" Enable smart-tabs
set shiftround " round indent to a multiple of 'shiftwidth'
set noexpandtab		" use tabs not spaces
" for tabs to work these need to be the same
set shiftwidth=4	" Number of auto-indent spaces
set tabstop=4	" Number of spaces per Tab

" don't redraw while executing macros (better performance)
set lazyredraw

" No annoying sound on errors
set noerrorbells
set novisualbell

" Replace all is aliased to S.
nmap S :%s//g<Left><Left>
vmap S :s//g<Left><Left>

" allow indenting of code blocks without losing selection each time
vnoremap < <gv
vnoremap > >gv

" Turn persistent undo on , so can undo even when you close a buffer
if !isdirectory($HOME."/.vim-undo-dir")
	call mkdir($HOME."/.vim-undo-dir", "", 0700)
endif
set undodir=~/.vim-undo-dir
set undofile
set undolevels=10000

" Automatically deletes all trailing whitespace on save.
autocmd BufWritePre * %s/\s\+$//e


" enter vim at same place you left
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif


""""""""""""""""""""""""""""""
"    WINDOWS MANAGEMENT
""""""""""""""""""""""""""""""

" These move to the window in the direction chosen
" if it doesn't exist then it makes a split there
map <C-h> :call WinMove('h')<cr>
map <C-j> :call WinMove('j')<cr>
map <C-k> :call WinMove('k')<cr>
map <C-l> :call WinMove('l')<cr>

" Window movement shortcuts
" move to the window in the direction shown, or create a new window
function! WinMove(key)
    let t:curwin = winnr()
    exec "wincmd ".a:key
    if (t:curwin == winnr())
        if (match(a:key,'[jk]'))
            wincmd v
        else
            wincmd s
        endif
        exec "wincmd ".a:key
    endif
endfunction


""""""""""""""""""""""""""""""
"     PLUGIN SETTINGS        "
""""""""""""""""""""""""""""""

" ALE Settings
map <F8> :ALEToggle<CR>
inoremap <F8> <esc>:ALEToggle<CR>a

" Set flake8 as python linter and autopep8 as python fixer
let g:ale_fixers = {'python': ['autopep8']}
let g:ale_linters = {'python': ['flake8']}
