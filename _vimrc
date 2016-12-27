set nocompatible              " be iMproved, required
filetype off                  " required

"=====================================================
"" Vundle settings
"=====================================================

" set the runtime path to include Vundle and initialize
set rtp+=$HOME/vimfiles/bundle/Vundle.vim/                          " $HOME is usually C:/Users/luis
let path='$HOME/vimfiles/bundle'
call vundle#begin(path)

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

"-------------------=== Code/Project navigation ===-------------
Plugin 'majutsushi/tagbar'                " Class/module browser
Plugin 'scrooloose/nerdtree'              " Project and file navigation
Plugin 'ctrlpvim/ctrlp.vim'               " Fuzzy file, buffer, mru, tag, etc, finder
Plugin 'vim-airline/vim-airline'          " Status/tabline
Plugin 'vim-airline/vim-airline-themes'   " Ditto
Plugin 'fholgado/minibufexpl.vim'         " Buffer explorer/viewer

"-------------------=== Other ===-------------------------------
Plugin 'kien/rainbow_parentheses.vim'     " Color support for nested brackets
Plugin 'Raimondi/delimitMate'             " Auto pair brackets
Plugin 'rakr/vim-one'                     " Color scheme
Plugin 'ervandew/supertab'                " Enables tab completion when in insert mode
Plugin 'nathanaelkane/vim-indent-guides'  " Visually displays indent levels
Plugin 'Yggdroot/indentLine'              " Displays spaces and tabs visually
Plugin 'flazz/vim-colorschemes'           " Colorschemes
Plugin 'dracula/vim'                      " GOAT colorscheme
Plugin 'myusuf3/numbers.vim'              " Shows relative and absolute line numbers when editing

"-------------------=== Languages support ===-------------------
Plugin 'tmhedberg/SimpylFold'             " Code folding
Plugin 'scrooloose/syntastic'             " Syntax checking plugin
Plugin 'scrooloose/nerdcommenter'         " Bulk Commenting
Plugin 'SirVer/ultisnips'                 " Snippet tool
Plugin 'honza/vim-snippets'               " The actual snippets
Plugin 'Shougo/neocomplete.vim'           " Code omnicompletion
" Plugin 'Valloric/YouCompleteMe'          " Alternative omnicompletion, harder to install, bigger e-peen tho

"-------------------=== Python  ===-----------------------------
Plugin 'nvie/vim-flake8'                  " Python linter, because PyLint is whiny
Plugin 'vim-scripts/indentpython.vim'     " Python indentations conforming to PEP8
Plugin 'davidhalter/jedi-vim'             " Python auto complete library

"--------------------=== C/C++ ===------------------------------
Plugin 'okws/OmniCppComplete'             " C/C++ Omnicompletion


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


set t_Co=256                              " Set 256 colors
colorscheme dracula                           " Set color scheme
syntax on

set clipboard=unnamed                     " Access system clipboard

set bs=2                                  " Make backspace behave like normal again

" Showing line numbers and length
set number                               " Show line numbers
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

:cd $HOME                               " Set default working directory

set guifont=M+\ 1mn:h10       " Set default font and font size


"=====================================================
"" YouCompleteMe settings
"=====================================================
" let g:ycm_global_ycm_extra_conf = '$HOME/.ycm_extra_conf.py'
" let g:ycm_server_use_vim_stdout = 1
" let g:ycm_server_log_level = 'debug'
" let g:ycm_confirm_extra_conf  = 0


"=====================================================
"" Neocomplete settings
"=====================================================
let g:acp_enableAtStartup = 1           " Disable AutoComplPop
let g:neocomplete#enable_at_startup = 1 " Use neocomplete
let g:neocomplete#enable_smart_case = 1 " Use smartcase
let g:neocomplete#sources#syntax#min_keyword_length = 3  " Set minimum syntax keyword length"

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return (pumvisible() ? "\<C-y>" : "" ) . "\<CR>"
  " For no inserting <CR> key.
  " return pumvisible() ? "\<C-y>" : "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>""

" Enable heavy omni completion.
if !exists('g:neocomplete#force_omni_input_patterns')
  let g:neocomplete#force_omni_input_patterns = {}
endif"
autocmd FileType python setlocal omnifunc=jedi#completions
    let g:jedi#completions_enabled = 0
    let g:jedi#auto_vim_configuration = 0
    let g:neocomplete#force_omni_input_patterns.python =
    \ '\%([^. \t]\.\|^\s*@\|^\s*from\s.\+import \|^\s*from \|^\s*import \)\w*'


"=====================================================
"" YouCompleteMe settings
"=====================================================
let g:numbers_exclude = ['unite', 'tagbar', 'startify', 'gundo', 'vimshell', 'w3m', 'nerdtree', 'minibufexpl']


"=====================================================
"" Tabs / Buffers settings
"=====================================================
set switchbuf=useopen
set laststatus=2


"=====================================================
"" Flake-8 settings
"=====================================================
let no_flake8_maps = 1


"=====================================================
"" Ctrl-P settings
"=====================================================
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe  " Windows

let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
  \ 'file': '\v\.(exe|so|dll)$',
  \ 'link': 'some_bad_symbolic_links',
  \ }


"=====================================================
"" NERDTree settings
"=====================================================
autocmd VimEnter * NERDTree             " Start NERDTree automatically
let NERDTreeIgnore=['\.blf$', '\.regtrans-ms$', '\.pyc$', '\~$']    "ignore files in NERDTree
map <F2> :NERDTreeToggle<CR>            " Press F2 for NERDTreeToggle
autocmd VimEnter * NERDTree             " Start NERDTree Automatically
autocmd VimEnter * silent NERDTree      " Supress warning at startup
autocmd VimEnter * wincmd p             " Move cursor to editing window


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
"" Indent Guides settings
"=====================================================
let g:indent_guides_enable_on_vim_startup=1


"=====================================================
"" Indent Line settings
"=====================================================
let g:indentLine_setColors = 0          " Highlight conceal color with colorscheme
let g:indentLine_enabled = 1            " Enable by default


"=====================================================
"" UltiSnips settings
"=====================================================
let g:UltiSnipsExpandTrigger="<F4>"
let g:UltiSnipsJumpForwardTrigger="<c-f>"
let g:UltiSnipsJumpBackwardTrigger="<c-a>"


"=====================================================
"" SimpylFold settings
"=====================================================
let g:SimpylFold_docstring_preview = 1
let g:SimpylFold_fold_import = 1
autocmd BufWinEnter *.py setlocal foldexpr=SimpylFold(v:lnum) foldmethod=expr
autocmd BufWinLeave *.py setlocal foldexpr< foldmethod<


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

" Search and replace word under cursor using spacebar
nnoremap <space> :%s/<c-r><c-w>/<c-r><c-w>/gc<c-f>$F/i

" Previous buffer
nmap <F9> :bprev<CR>
" Next buffer
nmap <F10> :bnext<CR>

" Enable folding with the spacebar
nnoremap <F6> za

nnoremap <F5> :w<CR>:!python %<CR>

" Ctrl-CR expands curly braces and auto-indents
imap <C-Return> <CR><CR><C-o>k<Tab>

" nnoremap <F7> :NumbersToggle<CR>
" nnoremap <F8> :NumbersOnOff<CR>
nnoremap <F8> :NumbersToggle<CR>
