call pathogen#infect()
syntax on
filetype plugin indent on

runtime macros/matchit.vim

syntax enable
set background=light
colorscheme solarized

set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab
set smarttab

set showcmd                       " Display incomplete commands.
set showmode                      " Display the mode you're in.

set backspace=indent,eol,start    " Intuitive backspacing.

set hidden                        " Handle multiple buffers better.

set wildmenu                      " Enhanced command line completion.
set wildmode=list:longest         " Complete files like a shell.

"set ignorecase                    " Case-insensitive searching.
set smartcase                     " But case-sensitive if expression contains a capital letter.

set number                        " Show line numbers.
set ruler                         " Show cursor position.

set incsearch                     " Highlight matches as you type.
set nohlsearch                    " Don't Highlight matches.

set wrap                          " Turn on line wrapping.
set scrolloff=3                   " Show 3 lines of context around the cursor.

set title                         " Set the terminal's title

set visualbell                    " No beeping.

set nobackup                      " Don't make a backup before overwriting a file.
set nowritebackup                 " And again.

set laststatus=2                  " Show the status line all the time

set autowrite                     " Save a file when you switch between buffers
set autowriteall                  " Save all files when vim quits

" Supposedly needed for 256 colors
set t_Co=256

" Useful status information at bottom of screen
set statusline=[%n]\ %<%.99f\ %h%w%m%r%y\ %{exists('*CapsLockStatusline')?CapsLockStatusline():''}%=%-16(\ %l,%c-%v\ %)%P

let mapleader = ","
let g:mapleader = ","

" Integrate vim clipbaord with OS clipboard
set clipboard=unnamed

" Make invisibles looks like TextMate
set list
set listchars=tab:▸\ ,eol:¬

" Remove trailing spaces from each line automatically on save
autocmd BufWritePre * :%s/\s\+$//e

" use ctrl-h/j/k/l to switch between splits
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l
map <c-h> <c-w>h

" let's also use ctrl+arrows to switch between splits
nnoremap <silent> <C-Right> <c-w>l
nnoremap <silent> <C-Left> <c-w>h
nnoremap <silent> <C-Up> <c-w>k
nnoremap <silent> <C-Down> <c-w>j

"make < > shifts keep selection like TextMate
nmap <D-[> <<
nmap <D-]> >>
vmap <D-[> <gv
vmap <D-]> >gv

"Edit file in same directory as current file
cnoremap %% <C-R>=expand('%:p:h').'/'<CR>
map <leader>e :edit %%

"Jump to definition, showing quick list if multiple matches
nmap <c-t> g<c-]>

map <leader>be :BufExplorer<cr>
map <leader>nt :NERDTreeToggle<cr>
map <leader>/ :NERDComToggleComment<cr>
map <leader>a :Ack <cword><cr>
map <leader>s :Ack <cword> app config lib script spec test vendor<cr>
map <leader>p "_cw<c-R>"
map <leader>c :CoffeeCompile vert<cr>

if exists(":Tabularize")
  nmap <Leader>a= :Tabularize /=<CR>
  vmap <Leader>a= :Tabularize /=<CR>
  nmap <Leader>a: :Tabularize /:\zs<CR>
  vmap <Leader>a: :Tabularize /:\zs<CR>
endif

" Because I am an idiot
abbr familiy family

" Settings for VimClojure
let vimclojure#HighlightBuiltins=1
let vimclojure#ParenRainbow=1

let g:ScreenImpl='Tmux'
noremap <leader>S :ScreenShell
vnoremap <leader>s :ScreenSend<CR>
noremap <leader>s :ScreenSend<CR>

command W w
command Wa wa
command WA wa

" other filetypes plugins don't understand
au BufNewFile,BufRead *.mobile.erb set filetype=html.eruby.eruby-rails
