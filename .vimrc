" fix cursor in vim
if &term =~ '^xterm'
  " enter vim
  autocmd VimEnter * silent !echo -ne "\e[2 q"
  " oherwise
  let &t_EI .= "\<Esc>[2 q"
  " insert mode
  let &t_SI .= "\<Esc>[5 q"
  " 1 or 0 -> blinking block
  " 2 -> solid block
  " 3 -> blinking underscore
  " 4 -> solid underscore
  " Recent versions of xterm (282 or above) also support
  " 5 -> blinking vertical bar
  " 6 -> solid vertical bar
  " leave vim
  autocmd VimLeave * silent !echo -ne "\e[5 q"
endif

colorscheme onedark
"
" Disable compatibility with vi which can cause unexpected issues
set nocompatible

" Enable file type detection
filetype on

" Enable plugins and load plugins for the detected file type
filetype plugin on

" Load an indent file for the detected file type
filetype indent on

" Enable syntax highlighting
syntax on

" Turn line numbers on
set number

" Horizontal highlight for current line
set cursorline

" Vertical highlight for current column
" set cursorcolumn

" Set shift width to 4 spaces
set shiftwidth=4

" Set tab width to 4 columns
set tabstop=4

" Use spaces instead of tabs
set expandtab

" Don't save backup files
set nobackup

" Don't let cursor scroll below or above N number of lines when scrolling
set scrolloff=10

" Do not wrap lines
set nowrap

" Highlight matching characters when searching
set incsearch

" Ignore capitals during search
set ignorecase

" Override ignorecase when searching with capital letters
set smartcase

" Show partial command you type in the last line of the screen
set showcmd

" Show mode on last line
set showmode

" Show matching words during a search
set showmatch
set hlsearch

" WILDMENU
"
" Enable autocompletion menu after pressing TAB
set wildmenu

" Make wildmenu behave similar to bash completion
set wildmode=list:longest

" Ignore list for wildmenu (files you wouldn't edit with vim)
set wildignore=*.docx,*.jpg,*.png,*.gif,*.pdf,*.exe
"
"
" PLUGINS ---------------------------------------------------------------- {{{

" Plugin code goes here.
call plug#begin('~/.vim/plugged')

    Plug 'preservim/nerdtree'

call plug#end()
" }}}


" MAPPINGS --------------------------------------------------------------- {{{

" Mappings code goes here.
let mapleader = '\'

nnoremap <leader>\ :nohlsearch<CR>

nnoremap <S-Up> ddkP 
nnoremap <S-Down> ddp

" automaticaly leave insert mode after createing a new line with o or O
"nnoremap o o<esc>
"nnoremap O O<esc>

" Center the cursor vertically when moving to the next word during a search.
nnoremap n nzz
nnoremap N Nzz

" You can split the window in Vim by typing :split or :vsplit.
" Navigate the split view easier by pressing CTRL+j, CTRL+k, CTRL+h, or CTRL+l.
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l

" Resize split windows using arrow keys by pressing:
" CTRL+UP, CTRL+DOWN, CTRL+LEFT, or CTRL+RIGHT.
noremap <c-up> <c-w>+
noremap <c-down> <c-w>-
noremap <c-left> <c-w>>
noremap <c-right> <c-w><

" NERDTree specific mappings.
" Map the F3 key to toggle NERDTree open and close.
nnoremap <F3> :NERDTreeToggle<cr>

" }}}


" VIMSCRIPT -------------------------------------------------------------- {{{

" This will enable code folding.
" Use the marker method of folding.
augroup filetype_vim
    autocmd!
    autocmd FileType vim setlocal foldmethod=marker
augroup END

" More Vimscripts code goes here.

" }}}


" STATUS LINE ------------------------------------------------------------ {{{

" Status bar code goes here.

" Clear status line when vimrc is reloaded.
set statusline=

" Status line left side.
set statusline+=\ %F\ %M\ %Y\ %R

" Use a divider to separate the left side from the right side.
set statusline+=%=

" Status line right side.
set statusline+=\ row:\ %l\ col:\ %c\ percent:\ %p%%

" Show the status on the second to last line.
set laststatus=2

" }}}
