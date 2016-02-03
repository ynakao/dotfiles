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
set noeb vb t_vb= "disable beep
set backspace=2
set shell=/bin/sh " in fish shell might need to add
set whichwrap=b,s,h,l,<,>,[,],~ " write after "set nocompatible"
set rtp+=/usr/local/opt/fzf
syntax enable
let mapleader="\<Space>"
nnoremap <Space> <Nop>

inoremap jj <Esc>

" <vim-plug settings>
call plug#begin('~/.config/nvim/plugged')

function! BuildYCM(info)
  if a:info.status == 'installed' || a:info.force
    !./install.sh --clang-completer
  endif
endfunction

Plug 'Valloric/YouCompleteMe', { 'do': function('BuildYCM') }
Plug 'altercation/vim-colors-solarized'
Plug 'vim-airline/vim-airline'
Plug 'majutsushi/tagbar'
Plug 'scrooloose/syntastic'
Plug 'Yggdroot/indentLine'
Plug 'fatih/vim-go'
Plug 'rust-lang/rust.vim'
Plug 'rdnetto/YCM-Generator', { 'branch': 'stable'}

call plug#end()
" </vim-plug settings>

" YouCompleteMe settings
let g:ycm_collect_identifiers_from_tags_files = 1 " Let YCM read tags from Ctags file
let g:ycm_use_ultisnips_completer = 1 " Default 1, just ensure
let g:ycm_seed_identifiers_with_syntax = 1 " Completion for programming language's keyword
let g:ycm_complete_in_comments = 1 " Completion in comments
let g:ycm_complete_in_strings = 1 " Completion in string

let g:ycm_global_ycm_extra_conf = '~/.ycm_extra_conf.py'
let g:ycm_confirm_extra_conf = 0 " ignore the confirmation of loading file

" Enable python3 completetion
let g:ycm_python_binary_path = '/usr/local/bin/python3'

" vim-color-solarized settings
set background=dark
colorscheme solarized
let g:solarized_termcolors=256

" vim-airline settings
set laststatus=2

" tagbar settings
nmap <leader>t :TagbarToggle<CR>
let g:tagbar_width = 20

" syntastic settings
let g:syntastic_python_checkers = ['flake8']

" indentLine settings
" disable auto hide feature
let g:indentLine_noConcealCursor = ""

" vim-go settings
au FileType go nmap <leader>r :GoRun<CR>

let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1

"Rust semantic completion
let g:ycm_rust_src_path = '~/Downloads/SyncDL/rust/src'
