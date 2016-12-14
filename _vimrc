set nocompatible              " be iMproved, required
filetype off                  " required

"=====================================================
"" Vundle settings
"=====================================================

" set the runtime path to include Vundle and initialize
set rtp+=$HOME/vimfiles/bundle/Vundle.vim/                          " $HOME is usually C:/Users/luis
let path='$HOME/vimfiles/bundle'
call vundle#begin(path)
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

"-------------------=== Code/Project navigation ===-------------
Plugin 'majutsushi/tagbar'                " Class/module browser
Plugin 'scrooloose/nerdtree'              " Project and file navigation

"-------------------=== Other ===-------------------------------
Plugin 'kien/rainbow_parentheses.vim'     " Color support for nested brackets
Plugin 'Raimondi/delimitMate'             " Auto pair brackets
Plugin 'rakr/vim-one'                     " Color scheme
Plugin 'fholgado/minibufexpl.vim'         " Buffer explorer/viewer
Plugin 'ervandew/supertab'                " Tab completion
Plugin 'Lokaltog/vim-powerline'           " Fancy fartsy status line

"-------------------=== Languages support ===-------------------
Plugin 'tmhedberg/SimpylFold'             " Code folding
Plugin 'scrooloose/syntastic'             " Syntax checking plugin
Plugin 'scrooloose/nerdcommenter'         " Bulk Commenting
Plugin 'SirVer/ultisnips'                 " Snippet tool
Plugin 'honza/vim-snippets'               " The actual snippets

"-------------------=== Python  ===-----------------------------
Plugin 'nvie/vim-flake8'                  " Python linter
Plugin 'vim-scripts/indentpython.vim'     " Python indentations conforming to PEP8

"-------------------=== C/C++  ===-----------------------------


call vundle#end()                         " required
filetype plugin on
filetype plugin indent on

"=====================================================
"" General settings
"=====================================================

set encoding=utf-8                        " Standard encoding

" Enable folding
set foldmethod=indent
set foldlevel=99

" These two MUST be inserted BEFORE the colorscheme command
" autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red    " Highlight unnecessary whitespace
" au InsertLeave * match ExtraWhitespace /\s\+$/

set t_Co=256                              " Set 256 colors
colorscheme one                           " Set color scheme
syntax on

set clipboard=unnamed                     " Access system clipboard

set bs=2                                  " Make backspace behave like normal again

" Rebind <Leader> key
" I like to have it here becuase it is easier to reach than the default and
" it is next to ``m`` and ``n`` which I use for navigating between tabs.
let mapleader = ","

" Showing line numbers and length
set number                               " Show line numbers
"" set tw=79                             " Width of document (used by gd)
"" set nowrap                            " Don't automatically wrap on load
"" set fo-=t                             " Don't automatically wrap text when typing
set colorcolumn=80                       " Color column 80 a different color
highlight ColorColumn ctermbg=233

" Disable stupid backup and swap files - they trigger too many events
" for file system watchers
set nobackup
set nowritebackup
set noswapfile

set wildmenu                            " visual autocomplete for command menu

set backspace=indent,eol,start          " Backspace removes all (indents, EOLs, start) What is start?

autocmd GUIEnter * simalt ~x            " Start GVim maximized


"=====================================================
"" Tabs / Buffers settings
"=====================================================
set switchbuf=useopen
set laststatus=2


"=====================================================
"" NERDTree settings
"=====================================================
autocmd VimEnter * NERDTree             " Start NERDTree automatically
let NERDTreeIgnore=['\.pyc$', '\~$']    "ignore files in NERDTree
map <F2> :NERDTreeToggle<CR>            " Press F2 for NERDTreeToggle
autocmd VimEnter * NERDTree             " Start NERDTree Automatically


"=====================================================
"" NERDCommenter settings
"=====================================================
let g:NERDSpaceDelims = 1               " Add spaces after comment delimiters by default
let g:NERDCompactSexyComs = 1           " Use compact syntax for prettified multi-line comments
let g:NERDDefaultAlign = 'left'         " Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDCommentEmptyLines = 1         " Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDTrimTrailingWhitespace = 1    " Enable trimming of trailing whitespace when uncommenting


"=====================================================
"" Syntastic settings
"=====================================================
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

let g:syntastic_python_checkers = ['flake8']   " Because PyLint is annoying

"=====================================================
"" Rainbow pareentheses settings
"=====================================================
let g:rbpt_colorpairs = [
    \ ['brown',       'RoyalBlue3'],
    \ ['Darkblue',    'SeaGreen3'],
    \ ['darkgray',    'DarkOrchid3'],
    \ ['darkgreen',   'firebrick3'],
    \ ['darkcyan',    'RoyalBlue3'],
    \ ['darkred',     'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['brown',       'firebrick3'],
    \ ['gray',        'RoyalBlue3'],
    \ ['black',       'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['Darkblue',    'firebrick3'],
    \ ['darkgreen',   'RoyalBlue3'],
    \ ['darkcyan',    'SeaGreen3'],
    \ ['darkred',     'DarkOrchid3'],
    \ ['red',         'firebrick3'],
    \ ]

" Rainbow always on
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

"=====================================================
"" delimitMate settings
"=====================================================
let delimitMate_expand_cr = 1           " Auto indent inside brackets
let delimitMate_expand_space = 1

"=====================================================
"" TagBar settings
"=====================================================
let g:tagbar_autofocus=0
let g:tagbar_width=42
let g:tagbar_show_linenumbers = -1
autocmd BufEnter *.py :call tagbar#autoopen(0)
autocmd BufWinLeave *.py :TagbarClose


"=====================================================
"" Python settings
"=====================================================
let g:pymode_python='python'            " python executables for different plugins
let g:jedi#force_py_version=3

" Proper PEP8 indentation for python
au BufNewFile,BufRead *.py
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4 |
    \ set textwidth=79 |
    \ set expandtab |
    \ set autoindent |
    \ set fileformat=unix

" Indentation for other file types
au BufNewFile,BufRead *.js, *.html, *.css, *.c, *.ino
    \ set tabstop=2 |
    \ set softtabstop=2 |
    \ set shiftwidth=2

let python_highlight_all=1


"=====================================================
"" Supertab settings
"=====================================================
let g:SuperTabDefaultCompletionType = "<c-n>"


"=====================================================
"" UltiSnips settings
"=====================================================
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"


"=====================================================
"" Custom keybindings
"=====================================================
"split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Rebind <Leader> key
" I like to have it here becuase it is easier to reach than the default and
" it is next to ``m`` and ``n`` which I use for navigating between tabs.
let mapleader = ","

" Search and replace word under cursor using F4
nnoremap <F4> :%s/<c-r><c-w>/<c-r><c-w>/gc<c-f>$F/i

nmap <F9> :bprev<CR>                    " Previous buffer
nmap <F10> :bnext<CR>                   " Next buffer

"=====================================================
"" Autocommands
"=====================================================
" Toggle light/dark backgrounds with F5
" call togglebg#map("<F5>")
