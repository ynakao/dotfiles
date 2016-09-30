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
" set rtp+=/usr/local/opt/fzf
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

Plug 'Valloric/YouCompleteMe', { 'on': [], 'do': function('BuildYCM') }
Plug 'altercation/vim-colors-solarized'
Plug 'vim-airline/vim-airline'
Plug 'majutsushi/tagbar'
" Plug 'scrooloose/syntastic'
Plug 'Yggdroot/indentLine'
Plug 'fatih/vim-go'
Plug 'rust-lang/rust.vim'
Plug 'rdnetto/YCM-Generator', { 'branch': 'stable'}
Plug 'benekastah/neomake'
Plug 'mbbill/undotree'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }

call plug#end()
" </vim-plug settings>

" Loading plugins manually
" https://github.com/Valloric/YouCompleteMe/issues/893#issuecomment-53151235
augroup load_ycm
  autocmd!
  autocmd! InsertEnter *
        \ call plug#load('YouCompleteMe')     |
        \ if exists('g:loaded_youcompleteme') |
        \   call youcompleteme#Enable()       |
        \ endif                               |
        \ autocmd! load_ycm
augroup END

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

let g:ycm_autoclose_preview_window_after_insertion = 1

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
" let g:syntastic_python_checkers = ['flake8']

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
let g:go_term_mode = "split" " split terminal horizontally

" rust settings
let g:ycm_rust_src_path = '~/Downloads/SyncDL/repo/rust/src'
let g:rustfmt_autosave = 1
au FileType rust nmap <leader>r :RustRun<CR>

" neomake settings
let g:neomake_python_enabled_makers = ['flake8']
let g:neomake_javascript_enabled_makers = ['jshint']
" run neomake on the current file on every write
autocmd! BufWritePost * Neomake

" undotree settings
" enable persistent undo
if has("persistent_undo")
    set undodir=~/.config/nvim/undodir
    set undofile
endif

" compile cpp file shortcut settings
au FileType cpp nmap <leader>r :!g++-6 -std=c++0x -o %< %<CR>
au FileType cpp nmap <leader>e :!./%<<CR> " execute
