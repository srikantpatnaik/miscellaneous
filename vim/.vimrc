"Michael Crosby crosbymichael.com
syntax on
set nonumber
colorscheme slate
set tabstop=4
set shiftwidth=4
set nocompatible

"additions
set title
set wildmenu
set completeopt=menuone,preview
"set ruler
"set cursorline

set hlsearch
set incsearch
set showmatch

"for indentions
set smartindent
set autoindent
set expandtab

"Code folding fold with za
set foldmethod=indent
set nofoldenable

"For autocomplete
autocmd BufEnter * :syntax sync fromstart

"Pugins
filetype on
filetype plugin on

let g:pydiction_location = '~/.vim/pydiction-1.2/complete-dict'
let g:pydiction_menu_height = 10

au FileType python set omnifunc=pythoncomplete#Complete
au FileType python setlocal expandtab shiftwidth=4 tabstop=8 softtabstop=4 smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class,with
au BufRead *.py set efm=%C\ %.%#,%A\ \ File\ \"%f\"\\,\ line\ %l%.%#,%Z%[%^\ ]%\\@=%m

"OmniComplete 
inoremap <Nul> <C-x><C-o>