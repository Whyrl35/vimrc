"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
"                         LANG                              "
"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
let $LANG='fr'
set langmenu=fr_FR.UTF-8


"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
"                         OPTION                            "
"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"

set nocompatible
set backspace=indent,eol,start
set nobackup
set noswapfile

if &t_Co > 2
  syntax on
    set hlsearch
endif

if has("autocmd")
  filetype plugin indent on
  augroup vimrcEx
  au!
  autocmd FileType text setlocal textwidth=78
  autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif
  augroup END
else
  set autoindent
endif

set aw
set awa
set notr
set tags=./tags,tags,.tags,~/.tags
set viminfo='50,\"1000,:100,n~/.viminfo
set ul=1000
set history=50
set showcmd
set incsearch
set nowrap

"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
"                         UI conf                           "
"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"

set ruler
set rulerformat=%15(%l,%c%V%M%)
set statusline=%<%f\ %h%m%r%=%-14.(%l,%c%V%)\ %P
set titlestring=%t%=%y%m%w%r\ %l/%L\ (%n)\ %p%% titlelen=120
set number

set mouse=ar
noremap <MiddleMouse> <LeftMouse><MiddleMouse>

set fdm=manual
map <C-L> <Esc>:e<Esc>G
set foldmethod=marker
" set foldclose=all

source $VIMRUNTIME/menu.vim
set wildmenu
set cpo-=<
set wcm=<C-Z>
map <F4> :emenu <C-Z>

highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/

"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
"                         Theme                             "
"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"

color molokai
"let g:molokai_original = 1
"let g:rehash256 = 1

if has('gui_running')
  set guifont="DejaVu2 Sans Mono for Powerline":h10
  set guioptions-=m
  set guioptions-=T
  set guioptions-=r
  set guioptions-=L
endif

"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
"                         Pathogen init                     "
"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"

filetype off
execute pathogen#infect()
execute pathogen#helptags()
filetype plugin indent on
syntax on

"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
"                         Plugin conf                       "
"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"

" Powerline
let g:Powerline_symbols = 'fancy'

" PowerLine vim-airline
let g:airline_powerline_fonts = 1
"let g:airline#extensions#tabline#enabled = 1

" Better Whitespace
autocmd BufWritePre * StripWhitespace
let g:better_whitespace_verbosity=1

" Tagbar
nmap <F8> :TagbarToggle<CR>
