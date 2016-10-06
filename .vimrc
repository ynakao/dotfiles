set number "line numbers
set title "show file names
set showmatch "show matching brakets
syntax enable "syntax highlight
set tabstop=4 "tab 4 spaces
set smartindent "enable autoindent
set shiftwidth=4 "4 spaces when autoindent
set expandtab "substitute spaces for tabs
set ignorecase "case insensitive search
set smartcase "case sensitive search when query including upper character
set wrapscan "restart search from the begining when hit the last one
set wrap
set noeb vb t_vb= "disable beep
set encoding=utf-8
set backspace=2 "make backspace work
set clipboard=unnamed "enable copy with system clipboard
"set conceallevel=0 "disable the auto-hide feature
language C

" <key mapping>
" jj to normal mode
inoremap jj <Esc>
" </key mapping>

" <vim-plug settings>
call plug#begin('~/.vim/plugged')

Plug 'altercation/vim-colors-solarized'
Plug 'fatih/vim-go'
Plug 'vim-airline/vim-airline'
Plug 'majutsushi/tagbar'
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/syntastic'
Plug 'tpope/vim-fugitive'
Plug 'Yggdroot/indentLine'
Plug 'rust-lang/rust.vim'

call plug#end()
" </vim-plug settings>

set background=dark
colorscheme solarized
let g:solarized_termcolors=256

" This enables cursor move to next or previous line at line ends.
" Write after "set nocompatible"
set whichwrap=b,s,h,l,<,>,[,],~

" vim-airline settings
set laststatus=2

" NERDTree Toggle
nnoremap <F2> :NERDTreeToggle<cr>

" syntastic settings
let g:syntastic_python_checkers = ['flake8']
let g:syntastic_javascript_checkers = ['jshint']
let g:syntastic_html_checkers = ['jshint']

" indentLine settings
" disable auto hide feature
let g:indentLine_noConcealCursor = ""

" tagbar settings
nmap <Space>t :TagbarToggle<CR>
let g:tagbar_width = 20
