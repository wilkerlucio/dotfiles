set nocompatible                            " Must come first because it changes other options.
autocmd BufWritePost .vimrc source ~/.vimrc " Reload vim configuration automatic

silent! call pathogen#runtime_append_all_bundles()

syntax enable                                " Turn on syntax highlighting.
filetype plugin indent on                    " Turn on file type detection.

runtime macros/matchit.vim                   " Load the matchit plugin.

set showcmd                                  " Display incomplete commands.
set showmode                                 " Display the mode you're in.

set backspace=indent,eol,start               " Intuitive backspacing.

set hidden                                   " Handle multiple buffers better.

set wildmenu                                 " Enhanced command line completion.
set wildmode=list:longest                    " Complete files like a shell.

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

" Useful status information at bottom of screen
set statusline=[%n]                                                                                  " buffer number
set statusline+=\ %<%.99f\                                                                           " file name
set statusline+=%h                                                                                   " help buffer flag
set statusline+=%w                                                                                   " preview window flag
set statusline+=%m                                                                                   " modified flag
set statusline+=%r                                                                                   " read-only flag
set statusline+=%y                                                                                   " file type
set statusline+=%{\"[\".(&fenc==\"\"?&enc:&fenc).((exists(\"+bomb\")\ &&\ &bomb)?\",B\":\"\").\"]\"} "file encoding
set statusline+=%{fugitive#statusline()}                                                             " fugitive info, for repository information
set statusline+=%=                                                                                   " start right section
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

" CoffeeScript configuration
let coffee_no_trailing_space_error = 1

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

autocmd BufNewFile,BufRead *.rss,*.atom setfiletype xml
autocmd BufNewFile,BufRead *.erb setfiletype eruby
autocmd BufNewFile,BufRead *.jss setfiletype css
autocmd BufNewFile,BufRead Gemfile,Guardfile,*.prawn,config.ru setfiletype ruby

" auto clean Fugitive buffers
autocmd BufReadPost fugitive://* set bufhidden=delete

" Configuring tabs for file types
" autocmd FileType html setlocal noexpandtab
" autocmd FileType eruby setlocal noexpandtab
" autocmd FileType javascript setlocal noexpandtab
" autocmd FileType php setlocal noexpandtab

" For the MakeGreen plugin and Ruby RSpec. Uncomment to use.
" autocmd BufNewFile,BufRead *_spec.rb compiler rspec

" Code cleanup
" autocmd BufWritePre * :%s/\\s\\+$//e
" autocmd BufWritePre * :retab

" Mapping <C-Enter>
inoremap <C-Enter> <Esc>a<CR><Esc>O

" Taglist configuration
let Tlist_Ctags_Cmd = '/usr/local/Cellar/ctags/5.8/bin/ctags'

" Syntastic
" let g:syntastic_enable_signs = 1

" Map for hide search
nmap <Leader>h :noh<CR>
vmap <Leader>h :noh<CR>

" Map for remove trailing spaces
nmap <Leader>s :%s/\\s\\+$//e<CR>

" Map for CommandT
nmap <Leader>t :CommandT<CR>
vmap <Leader>t :CommandT<CR>
nmap <Leader>f :CommandTFlush<CR>
vmap <Leader>f :CommandTFlush<CR>
nmap <Leader>b ;CommandTBuffer<CR>

" ACP configuration
let g:acp_behaviorRubyOmniMethodLength = -1
let g:acp_behaviorRubyOmniSymbolLength = -1
let g:acp_behaviorPythonOmniLength     = -1
let g:acp_behaviorPerlOmniLength       = -1
let g:acp_behaviorXmlOmniLength        = -1
let g:acp_behaviorHtmlOmniLength       = -1

" Tabularize
nmap <Leader>a= :Tabularize /=<CR>
vmap <Leader>a= :Tabularize /=<CR>
nmap <Leader>a> :Tabularize /=><CR>
vmap <Leader>a> :Tabularize /=><CR>
nmap <Leader>a: :Tabularize /:\zs/l0l1<CR>
vmap <Leader>a: :Tabularize /:\zs/l0l1<CR>
nmap <Leader>a, :Tabularize /,\zs/l0l1<CR>
vmap <Leader>a, :Tabularize /,\zs/l0l1<CR>

inoremap <silent> <Bar>   <Bar><Esc>:call <SID>align()<CR>a

function! s:align()
  let p = '^\s*|\s.*\s|\s*$'
  if exists(':Tabularize') && getline('.') =~# '^\s*|' && (getline(line('.')-1) =~# p || getline(line('.')+1) =~# p)
    let column = strlen(substitute(getline('.')[0:col('.')],'[^|]','','g'))
    let position = strlen(matchstr(getline('.')[0:col('.')],'.*|\s*\zs.*'))
    Tabularize/|/l1
    normal! 0
    call search(repeat('[^|]*|',column).'\s\{-\}'.repeat('.',position),'ce',line('.'))
  endif
endfunction

" Bubbling text
nmap <C-Up> [e
nmap <C-Down> ]e
vmap <C-Up> [egv
vmap <C-Down> ]egv
