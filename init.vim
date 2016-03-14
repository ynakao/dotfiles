set number
set title
set showmatch
set tabstop=4
" set smartindent
set cindent
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
syntax enable
let mapleader="\<Space>"
nnoremap <Space> <Nop>

" key bindings
inoremap jj <Esc>
" tab completion in deoplete
inoremap <silent><expr> <Tab>
        \ pumvisible() ? "\<C-n>" :
        \ deoplete#mappings#manual_complete()

" <vim-plug settings>
call plug#begin('~/.config/nvim/plugged')

" function! BuildYCM(info)
"   if a:info.status == 'installed' || a:info.force
"     !./install.sh --clang-completer
"   endif
" endfunction

" Plug 'Valloric/YouCompleteMe', { 'do': function('BuildYCM') }
Plug 'altercation/vim-colors-solarized'
" Plug 'bling/vim-airline'
Plug 'vim-airline/vim-airline'
Plug 'majutsushi/tagbar'
" Plug 'scrooloose/syntastic'
Plug 'Yggdroot/indentLine'
Plug 'fatih/vim-go'
Plug 'rust-lang/rust.vim'
Plug 'Shougo/deoplete.nvim'
Plug 'benekastah/neomake'
" Plug 'davidhalter/jedi-vim'
Plug 'zchee/deoplete-jedi'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
" Plug 'justmao945/vim-clang'
" Plug 'Rip-Rip/clang_complete'
Plug 'zchee/deoplete-clang'
Plug 'racer-rust/vim-racer'

call plug#end()
" </vim-plug settings>

" " YouCompleteMe settings
" let g:ycm_collect_identifiers_from_tags_files = 1 " Let YCM read tags from Ctags file
" let g:ycm_use_ultisnips_completer = 1 " Default 1, just ensure
" let g:ycm_seed_identifiers_with_syntax = 1 " Completion for programming language's keyword
" let g:ycm_complete_in_comments = 1 " Completion in comments
" let g:ycm_complete_in_strings = 1 " Completion in string
" 
" let g:ycm_global_ycm_extra_conf = '~/.ycm_extra_conf.py'
" let g:ycm_confirm_extra_conf = 0 " ignore the confirmation of loading file

" vim-color-solarized settings
set background=dark
colorscheme solarized
let g:solarized_termcolors=256

" vim-airline settings
set laststatus=2

" tagbar settings
nmap <leader>t :TagbarToggle<CR>
let g:tagbar_width = 20

" " syntastic settings
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

" deoplete settings
" Use deoplete.
let g:deoplete#enable_at_startup = 1
" Use smartcase.
let g:deoplete#enable_smart_case = 1

" neomake settings
let g:neomake_python_enabled_makers = ['flake8']
" run neomake on the current file on every write
autocmd! BufWritePost * Neomake

" jedi-vim and deoplete config
" autocmd FileType python setlocal omnifunc=jedi#completions
" let g:jedi#completions_enabled = 0
" let g:jedi#auto_vim_configuration = 0
" let g:jedi#smart_auto_mappings = 0
" let g:jedi#show_call_signatures = 0
" let g:jedi#force_py_version = 3
" set completeopt-=preview

" clang_complete and deoplete config
" let g:clang_complete_auto = 0
" let g:clang_auto_select = 0
" let g:clang_omnicppcomplete_compliance = 0
" let g:clang_default_keymappings = 0
" let g:clang_use_library = 1
" let g:clang_library_path = "/usr/local/opt/llvm/lib/"

" deoplete-clang config
" libclang shared library path
let g:deoplete#sources#clang#libclang_path = '/usr/local/opt/llvm/lib/libclang.dylib'
" or
"let g:deoplete#sources#clang#libclang_path = '/opt/llvm/lib/libclang.so'

" clang builtin header path
let g:deoplete#sources#clang#clang_header = '/usr/local/opt/llvm/lib/clang/3.6.2/include/'

" libclang default compile flags
let g:deoplete#sources#clang#flags = ['-x', 'c', '-std=c11']
" or c++
let g:deoplete#sources#clang#flags = ['-x', 'c++', '-std=c++11']

" libclang complete result sort algorism
" Default: '' -> deoplete.nvim delault sort order
" libclang priority sort order
let g:deoplete#sources#clang#sort_algo = 'priority'
" alphabetical sort order
let g:deoplete#sources#clang#sort_algo = 'alphabetical'

" compile_commands.json directory path
" Not file path. Need build directory path
" let g:deoplete#sources#clang#clang_complete_database = '/path/to/neovim/build'

" debug
" let deoplete#enable_debug = 1
" let g:deoplete#sources#clang#debug#log_file = '~/.log/nvim/python/deoplete-clang.log'

" vim-racer settings
set hidden
let g:racer_cmd = "~/.cargo/bin/racer"
let $RUST_SRC_PATH="~/Downloads/SyncDL/rust/src/"
