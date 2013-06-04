set nocompatible                            " Must come first because it changes other options.
filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'
Bundle 'tpope/vim-abolish'
Bundle 'tpope/vim-dispatch'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-endwise'
Bundle 'tpope/vim-haml'
Bundle 'tpope/vim-markdown'
Bundle 'tpope/vim-rails.git'
Bundle 'tpope/vim-ragtag'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-rake'
Bundle 'tpope/vim-repeat'
Bundle 'tpope/vim-unimpaired'
Bundle 'scrooloose/nerdtree'
Bundle 'kien/ctrlp.vim'
Bundle 'godlygeek/tabular'
Bundle 'airblade/vim-gitgutter'
Bundle 'kchmck/vim-coffee-script'
Bundle 'avakhov/vim-yaml'
Bundle 'mattn/gist-vim'
Bundle 'mattn/webapi-vim'
Bundle 'Valloric/YouCompleteMe'
Bundle 'rking/ag.vim'
Bundle 'skalnik/vim-vroom'
Bundle 'scrooloose/syntastic'
Bundle 'Raimondi/delimitMate'
Bundle 'wojtekmach/vim-rename'
Bundle 'vim-scripts/argtextobj.vim'
Bundle 'michaeljsmith/vim-indent-object'
Bundle 'nelstrom/vim-textobj-rubyblock'
Bundle 'tComment'

filetype plugin indent on

set shell=/bin/sh

runtime macros/matchit.vim                   " Enable ruby do/end matching

syntax enable                                " Turn on syntax highlighting.
filetype plugin indent on                    " Turn on file type detection.

set showcmd                                  " Display incomplete commands.
set showmode                                 " Display the mode you're in.

set backspace=indent,eol,start               " Intuitive backspacing.

set hidden                                   " Handle multiple buffers better.

set wildmenu                                 " Enhanced command line completion.
" set wildmode=list:longest                    " Complete files like a shell.
set wildmode=full                    " Complete files like a shell.

set ignorecase                               " Case-insensitive searching.
set smartcase                                " But case-sensitive if expression contains a capital letter.

set number                                   " Show line numbers.
set ruler                                    " Show cursor position.

set incsearch                                " Highlight matches as you type.
set hlsearch                                 " Highlight matches.

set nowrap                                   " Turn off line wrapping.
set scrolloff=3                              " Show 3 lines of context around the cursor.

set nofoldenable                             " Disable folding

set autoread                                 " automatic reload file if it's changed

set title                                    " Set the terminal's title

set visualbell                               " No beeping.

set nobackup                                 " Don't make a backup before overwriting a file.
set nowritebackup                            " And again.
set noswapfile                               " Disable swap files
set directory=$HOME/.vim/tmp/,.                 " Keep swap files in one location

set encoding=utf-8                           " output encoding
set fileencodings=utf-8,latin1,ucs-bom,cp936 " file encoding set order to load
set fileencoding=utf-8                       " file encoding
set termencoding=utf-8                       " terminal encoding

set tabstop=2                                " Global tab width.
set shiftwidth=2                             " And again, related.
set expandtab                                " Use spaces instead of tabs

set laststatus=2                             " Show the status line all the time

set colorcolumn=80                           " show column at 80 chars

" Useful status information at bottom of screen
set statusline=[%n]                                                                                  " buffer number
set statusline+=\ %<%.99f\                                                                           " file name
set statusline+=%h                                                                                   " help buffer flag
set statusline+=%w                                                                                   " preview window flag
set statusline+=%m                                                                                   " modified flag
set statusline+=%r                                                                                   " read-only flag
set statusline+=%y                                                                                   " file type
set statusline+=%{\"[\".(&fenc==\"\"?&enc:&fenc).((exists(\"+bomb\")\ &&\ &bomb)?\",B\":\"\").\"]\"} " file encoding
set statusline+=%{fugitive#statusline()}                                                             " fugitive info, for repository information
set statusline+=%=                                                                                   " start right section
set statusline+=%#warningmsg#                                                                        " syntastic warning message
set statusline+=%{SyntasticStatuslineFlag()}                                                         " syntastic status flag
set statusline+=%*                                                                                   " syntastic something
set statusline+=%-16(\ %l,%c-%v\ %)                                                                  " cursor position
set statusline+=%P                                                                                   " scroll percentual

" remap leader
let mapleader=','
let maplocalleader='-'

" set color scheme
colorscheme Tomorrow-Night

" show hidden characters
set list listchars=tab:▸\ ,trail:·

" highlight current line
set cursorline

" Controversial...swap colon and semicolon for easier commands
nnoremap ; :
vnoremap ; :

" Automatic fold settings for specific files. Uncomment to use.
" autocmd FileType ruby setlocal foldmethod=syntax
" autocmd FileType css  setlocal foldmethod=indent shiftwidth=2 tabstop=2
autocmd FileType xhtml,xml so ~/.vim/bundle/html_autoclosetag/ftplugin/html_autoclosetag.vim
autocmd FileType java setlocal shiftwidth=4 tabstop=4
autocmd FileType python setlocal shiftwidth=4 tabstop=4
autocmd FileType yaml setlocal autoindent
autocmd FileType xhtml,xml,html,eruby setlocal shiftwidth=2 tabstop=2 expandtab
autocmd FileType php setlocal shiftwidth=2 tabstop=2 expandtab smartindent

autocmd BufNewFile,BufRead *.rss,*.atom setfiletype xml
autocmd BufNewFile,BufRead *.erb setfiletype eruby
autocmd BufNewFile,BufRead *.jss setfiletype css
autocmd BufNewFile,BufRead *.json setfiletype javascript
autocmd BufNewFile,BufRead Gemfile,Guardfile,*.prawn,config.ru setfiletype ruby

" Source the vimrc file after saving it
autocmd bufwritepost .vimrc source $MYVIMRC

" auto clean Fugitive buffers
autocmd BufReadPost fugitive://* set bufhidden=delete

" Code cleanup
autocmd BufWritePre * :%s/\s\+$//e
autocmd BufWritePre * :retab

" Substitute command
" nmap <Leader>s *:%s//

" Map for hide search
nmap <Leader>h :noh<CR>
vmap <Leader>h :noh<CR>

" CtrlP
nmap <Leader>f :CtrlPClearAllCaches<CR>
nmap <Leader>b :CtrlPBuffer<CR>

let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/](\.git|\.hg|\.svn|spec[\/]cassettes|tmp)$',
  \ 'file': '\v\.(DS_Store)$',
  \ }

" Gist
let g:gist_clip_command = 'pbcopy'
let g:gist_detect_filetype = 1
let g:gist_open_browser_after_post = 1

" Syntastic
let g:syntastic_auto_jump=1

" VRoom
let g:vroom_test_unit_command = 'ruby -Itest -Ilib '

" YCM
let g:ycm_collect_identifiers_from_comments_and_strings=1

" Tabularize
nmap <Leader>a= :Tabularize /=<CR>
vmap <Leader>a= :Tabularize /=<CR>
nmap <Leader>a> :Tabularize /=><CR>
vmap <Leader>a> :Tabularize /=><CR>
nmap <Leader>a: :Tabularize /:\zs/l0l1<CR>
vmap <Leader>a: :Tabularize /:\zs/l0l1<CR>
nmap <Leader>a, :Tabularize /,\zs/l0l1<CR>
vmap <Leader>a, :Tabularize /,\zs/l0l1<CR>

map <Leader>c "+

vmap s S

inoremap <C-Return> <CR><Esc>ko
