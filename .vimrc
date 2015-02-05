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

" <NeoBundle settings>
" Note: Skip initialization for vim-tiny or vim-small.
if !1 | finish | endif

if has('vim_starting')
  set nocompatible               " Be iMproved

  " Required:
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

" Required:
call neobundle#begin(expand('~/.vim/bundle/'))

" Let NeoBundle manage NeoBundle
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'

" My Bundles here:
NeoBundle 'altercation/vim-colors-solarized'
NeoBundle 'briancollins/vim-jst'
NeoBundle 'ctrlpvim/ctrlp.vim'
NeoBundle 'davidhalter/jedi-vim'
NeoBundle 'fatih/vim-go'
NeoBundle 'itchyny/lightline.vim'
NeoBundle 'Lokaltog/vim-easymotion'
NeoBundle 'majutsushi/tagbar'
NeoBundle 'klen/python-mode'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'scrooloose/syntastic'
NeoBundle 'Shougo/neocomplete.vim'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'tpope/vim-surround'
NeoBundle 'Yggdroot/indentLine'
NeoBundle 'wavded/vim-stylus'
NeoBundle 'wting/rust.vim'
" Refer to |:NeoBundle-examples|.
" Note: You don't set neobundle setting in .gvimrc!

call neobundle#end()

" Required:
filetype plugin indent on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck
" </NeoBundle settings>

set background=dark
colorscheme solarized
let g:solarized_termcolors=256

" This enables cursor move to next or previous line at line ends.
" Write after "set nocompatible"
set whichwrap=b,s,h,l,<,>,[,],~

" <lightline config>
set laststatus=2
set t_Co=256
let g:lightline = {
      \ 'colorscheme': 'solarized'
      \ }
" </lightline config>

" NERDTree Toggle
nnoremap <F1> :NERDTreeToggle<cr>

" <Neocomplete settings>
"Note: This option must set it in .vimrc(_vimrc).  NOT IN .gvimrc(_gvimrc)!
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 3
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'
" Plugin key-mappings.
inoremap <expr><C-g>     neocomplete#undo_completion()
inoremap <expr><C-l>     neocomplete#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
" inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
" function! s:my_cr_function()
"   " return neocomplete#close_popup() . "\<CR>"
"   " For no inserting <CR> key.
"   return pumvisible() ? neocomplete#close_popup() : "\<CR>"
" endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
" inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
" inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
" inoremap <expr><C-y>  neocomplete#close_popup()
" inoremap <expr><C-e>  neocomplete#cancel_popup()

" Close popup by <Space>.
" inoremap <expr><Space> pumvisible() ? neocomplete#close_popup() : "\<Space>"
" </Neocomplete settings>

" <Neocomplete-Jedi config>
" ref: http://dackdive.hateblo.jp/entry/2014/08/13/130000
" NOT to show docstrings
autocmd FileType python setlocal completeopt-=preview
" OFF auto selection
autocmd FileType python setlocal omnifunc=jedi#completions
let g:jedi#completions_enabled = 0
" let g:jedi#auto_vim_configuration = 0

if !exists('g:neocomplete#force_omni_input_patterns')
        let g:neocomplete#force_omni_input_patterns = {}
endif

let g:neocomplete#force_omni_input_patterns.python = '\h\w*\|[^. \t]\.\w*'
" </Neocomplete-Jedi config>

" <python-mode settings>
" disable syntax check because of confliction with syntastic
let g:pymode_lint = 0
" Turn off code completion support in the plugin
let g:pymode_rope_completion = 0
" Turn on the rope script
let g:pymode_rope = 0
" </python-mode settings>

" syntastic settings
let g:syntastic_python_checkers = ['flake8']
let g:syntastic_javascript_checkers = ['jshint']
let g:syntastic_html_checkers = ['jshint']

" indentLine settings
" disable auto hide feature
let g:indentLine_noConcealCursor = ""

" tagbar settings
nmap <F8> :TagbarToggle<CR>
let g:tagbar_width = 25
