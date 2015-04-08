set number
set title
set showmatch
set tabstop=4
set smartindent
set shiftwidth=4
set expandtab
set ignorecase
set smartcase
set wrapscan
set wrap
set encoding=utf-8
set clipboard+=unnamedplus
set backspace=2
" in fish shell might need to add
set shell=/bin/sh
" write after "set nocompatible"
set whichwrap=b,s,h,l,<,>,[,],~
syntax enable

inoremap jj <Esc>

" <vim-plug settings>
call plug#begin('~/.nvim/plugged')

function! BuildYCM(info)
  if a:info.status == 'installed' || a:info.force
    !./install.sh --clang-completer
  endif
endfunction

Plug 'Valloric/YouCompleteMe', { 'do': function('BuildYCM') }
Plug 'altercation/vim-colors-solarized'
Plug 'bling/vim-airline'
Plug 'majutsushi/tagbar'
Plug 'scrooloose/syntastic'
Plug 'Yggdroot/indentLine'

call plug#end()
" </vim-plug settings>

" YouCompleteMe settings
let g:ycm_collect_identifiers_from_tags_files = 1 " Let YCM read tags from Ctags file
let g:ycm_use_ultisnips_completer = 1 " Default 1, just ensure
let g:ycm_seed_identifiers_with_syntax = 1 " Completion for programming language's keyword
let g:ycm_complete_in_comments = 1 " Completion in comments
let g:ycm_complete_in_strings = 1 " Completion in string

" vim-color-solarized settings
set background=dark
colorscheme solarized
let g:solarized_termcolors=256

" tagbar settings
nmap <Space>t :TagbarToggle<CR>
let g:tagbar_width = 20

" syntastic settings
let g:syntastic_python_checkers = ['flake8']

" indentLine settings
" disable auto hide feature
let g:indentLine_noConcealCursor = ""
