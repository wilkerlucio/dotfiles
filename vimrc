set nocompatible                  " Must come first because it changes other options.
autocmd BufWritePost .vimrc source ~/.vimrc " Reload vim configuration automatic

silent! call pathogen#runtime_append_all_bundles()

syntax enable                     " Turn on syntax highlighting.
filetype plugin indent on         " Turn on file type detection.

runtime macros/matchit.vim        " Load the matchit plugin.

set showcmd                       " Display incomplete commands.
set showmode                      " Display the mode you're in.

set backspace=indent,eol,start    " Intuitive backspacing.

set hidden                        " Handle multiple buffers better.

set wildmenu                      " Enhanced command line completion.
set wildmode=list:longest         " Complete files like a shell.

set ignorecase                    " Case-insensitive searching.
set smartcase                     " But case-sensitive if expression contains a capital letter.

set number                        " Show line numbers.
set ruler                         " Show cursor position.

set incsearch                     " Highlight matches as you type.
set hlsearch                      " Highlight matches.

set nowrap                        " Turn off line wrapping.
set scrolloff=3                   " Show 3 lines of context around the cursor.

set autoread                      " automatic reload file if it's changed

set title                         " Set the terminal's title

set visualbell                    " No beeping.

set nobackup                      " Don't make a backup before overwriting a file.
set nowritebackup                 " And again.
set directory=$HOME/.vim/tmp//,.  " Keep swap files in one location

set encoding=utf-8 fileencodings=utf-8,latin1,ucs-bom,cp936 fileencoding=utf-8 termencoding=utf-8 " Encoding

set tabstop=2                    " Global tab width.
set shiftwidth=2                 " And again, related.
set expandtab                    " Use spaces instead of tabs

set laststatus=2                  " Show the status line all the time

" Useful status information at bottom of screen
set statusline=[%n] " buffer number
set statusline+=\ %<%.99f\  " file name
set statusline+=%#warningmsg#%{SyntasticStatuslineFlag()}%* " syntax errors
set statusline+=%h " help buffer flag
set statusline+=%w " preview window flag
set statusline+=%m " modified flag
set statusline+=%r " read-only flag
set statusline+=%y " file type
set statusline+=%{\"[\".(&fenc==\"\"?&enc:&fenc).((exists(\"+bomb\")\ &&\ &bomb)?\",B\":\"\").\"]\"} "file encoding
set statusline+=%{fugitive#statusline()} " fugitive info, for repository information
set statusline+=%= " start right section
set statusline+=%-16(\ %l,%c-%v\ %) " cursor position
set statusline+=%P " scroll percentual

" remap leader
let mapleader=','

" set color scheme
colorscheme tubster

" show hidden characters
set nolist
set listchars=tab:▸\ ,eol:¬

" highlight current line
set cursorline

" Buffer Explorer
map <leader>bb ;BufExplorer<cr>

" CoffeeScript configuration
let coffee_no_trailing_space_error = 1

" Controversial...swap colon and semicolon for easier commands
nnoremap \ ;
nnoremap ; :
vnoremap \ ;
vnoremap ; :

" Automatic fold settings for specific files. Uncomment to use.
" autocmd FileType ruby setlocal foldmethod=syntax
" autocmd FileType css  setlocal foldmethod=indent shiftwidth=2 tabstop=2
autocmd FileType xhtml,xml so ~/.vim/bundle/html_autoclosetag/ftplugin/html_autoclosetag.vim
autocmd FileType java setlocal shiftwidth=4 tabstop=4
autocmd FileType python setlocal shiftwidth=4 tabstop=4
autocmd FileType yaml setlocal autoindent

" Configuring tabs for file types
" autocmd FileType html setlocal noexpandtab
" autocmd FileType eruby setlocal noexpandtab
" autocmd FileType javascript setlocal noexpandtab
" autocmd FileType php setlocal noexpandtab

" For the MakeGreen plugin and Ruby RSpec. Uncomment to use.
" autocmd BufNewFile,BufRead *_spec.rb compiler rspec

" Code cleanup
autocmd BufWritePre * :%s/\s\+$//e
autocmd BufWritePre * :retab

" Taglist configuration
let Tlist_Ctags_Cmd = '/usr/local/Cellar/ctags/5.8/bin/ctags'

" Zen Coding
let g:user_zen_expandabbr_key = '<c-e>'

" Syntastic
let g:syntastic_enable_signs = 1
