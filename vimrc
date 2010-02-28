syntax on
filetype plugin indent on
augroup myfiletypes
  " Clear old autocmds in group
  autocmd!
  " autoindent with two spaces, always expand tabs
  autocmd FileType ruby,eruby,yaml set ai sw=2 sts=2 et
augroup END

let mapleader = ","
vmap <Leader>b :<C-U>!git blame <C-R>=expand("%:p") <CR> \| sed -n <C-R>=line("'<""'") <CR>,<C-R>=line("'>""'") <CR>p <CR>

au Filetype html,xml,xsl,rhtml,erb source $HOME/.vim/scripts/closetag.vim

set autoindent
set number
set ruler
set nowrap
set viminfo+=!
set autoread
set backupdir=/tmp
set directory=/tmp
set gdefault
set ignorecase smartcase
set et
set mouse=a

