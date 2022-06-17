set nocompatible
filetype off

set encoding=utf-8 " standard encoding

set number " view line numbers
set relativenumber
set title " show file name in terminal window
set nowrap " do not wrap around text if line is too long
set cursorline "highlight the current line
set colorcolumn=120 " show column 120

" enable folding
set foldmethod=indent
set foldlevel=99

set completeopt=noinsert,menuone,noselect " modifies auto complete menu to be more IDE-like

" 2 space indent
set tabstop=2
set shiftwidth=2
set softtabstop=2
set shiftround
set expandtab " insert spaces instead of tabs

set hidden " allow switching buffers without saving them

set ignorecase " ignore upper cases when searching
set smartcase " do not ignore upper cases if the word being searched contains upper cases

set spelllang=en,es " auto correct for english and spanish

set termguicolors " activate true colors in the terminal
syntax on

set clipboard=unnamed " access system clipboard

set splitbelow splitright " screens will split below current screen and to the right

set bs=2 " backspace behaves like it should

" disable backup and swap files
set nobackup
set nowritebackup
set noswapfile

set wildmenu " visual autocomplete for command menu

set backspace=indent,eol,start " backspace removes all of these now

" tabs/buffers settings
set switchbuf=useopen
set laststatus=2

"================================================
" Custom keybindings
"================================================
" split navigation
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

nmap <F8> :bprev<CR> " previous buffer
nmap <F9> :bnext<CR> " next buffer
nnoremap <F1> :NERDTreeToggle<CR>
nnoremap <F5> :sp<CR>:terminal<CR>


let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.config/nvim/init.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

"=================================================
" Plugins
"=================================================
call plug#begin()
Plug 'folke/tokyonight.nvim', {'branch': 'main'}
Plug 'vim-airline/vim-airline'
Plug 'sheerun/vim-polyglot'
Plug 'jiangmiao/auto-pairs'
Plug 'preservim/nerdtree'
Plug 'junegunn/rainbow_parentheses.vim'
call plug#end()

"=================================================
" Plugin Configurations
"=================================================
" Airline
let g:airline_powerline_fonts=1
let g:airline#extensions#tabline#enabled=1

" NERDTree
let NERDTreeShowHidden=1

" colorscheme
let g:tokyonight_style="night"
colorscheme tokyonight

" Rainbow Parentheses
let g:rainbow#max_level=16
let g:rainbow#pars = [['(', ')'], ['[', ']']]
