" Vim-plug awesomeness
call plug#begin('~/.vim/plugged')
Plug 'itchyny/lightline.vim'
Plug 'godlygeek/csapprox'
Plug 'kien/ctrlp.vim'
Plug 'junegunn/goyo.vim'
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-markdown'
call plug#end()

" Vi is right out
set nocompatible

" Homegrown is best grown colorscheme
colorscheme jah_wombat

" Some nice aesthetic options
set ruler
set cursorline
set modeline
set number
set showcmd
set incsearch
set nohlsearch
set showmatch
set autoindent
set smartindent
set cindent
set lazyredraw
set title

" No backups, YOLO
set nobackup
set nowritebackup

set history=50
set viminfo+=n~/.vim/viminfo

" Tabs are spaces always please
set expandtab
set softtabstop=2
set shiftwidth=2

set laststatus=2
set backspace=2

" I never quite remember what these do but they're staying
set wildmenu
set wildmode=longest:full,full

" Use Xorg buffer as default
set clipboard=unnamed

" Gotta have my syntax and filetype helps
syntax on
filetype plugin indent  on

" For that Explorer goodness
let g:netrw_liststyle=3

" Demote suffixes we don't want to see in file searching
set suffixes=.bak,~,.swp,.o,.info,.aux,.log,.dvi,.bbl,.blg,.brf,.cb,.ind,.idx,.ilg,.inx,.out,.toc

" Keymappings for your health
nmap <space> <leader>
inoremap jj <Esc>
nnoremap E $
nnoremap $ <nop>
nnoremap <Leader>w :w<CR>
nnoremap <Leader>wq :wq<CR>
nnoremap <Leader>q :q<CR>
nnoremap <Leader>Q :q!<CR>
nnoremap <Leader>n :set number!<CR>
nnoremap <Leader>h :nohl<CR>
nnoremap <Leader>k :Vex<CR>
set pastetoggle=<F4>

" Window/pane/tab nav
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
nnoremap <C-w>h :vertical res -5<CR>
nnoremap <C-w>l :vertical res +5<CR>
nnoremap <C-w>j :res +5<CR>
nnoremap <C-w>k :res -5<CR>

nnoremap <Leader>sv :vne<CR>
nnoremap <Leader>sh :new<CR>

nnoremap <Leader>tn :tabnext<CR>
nnoremap <Leader>tp :tabprevious<CR>
nnoremap <Leader>te :tabedit<Space>
nnoremap <Leader>x :tabclose<CR>

nnoremap <Leader>wr :tabe +Goyo<Space>

" Special circumstances for reading mutt mails
"au BufNewFile,BufRead *tmp/*mutt* set ft=mail | set fo=aw | set tw=80 | set wrap | +/^--.$/-1\|+/^$/ | nohl | startinsert
au FileType mail set fo=aw tw=80 wrap | +/^$/ | startinsert

" Statusline times
" Make sure to grap git.io/lightline for sure
set laststatus=2
let g:lightline = {
    \ 'colorscheme': 'wombat',
    \ 'active': {
    \   'left': [ [ 'mode', 'paste' ],
    \             [ 'absolutepath', 'modified' ] ],
    \   'right': [ [ 'lineinfo'],
    \             [ 'percent' ],
    \             [ 'fileencoding', 'filetype' ] ] 
    \ }
    \ }
