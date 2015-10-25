" Vim-plug awesomeness
call plug#begin('~/.vim/plugged')
Plug 'romainl/Apprentice'
Plug 'godlygeek/csapprox'
Plug 'itchyny/lightline.vim'
call plug#end()

set nocompatible
colorscheme jah_wombat

set history=50
set ruler
set showcmd
set viminfo+=n/home/jared/.vim/viminfo
set incsearch
set nohlsearch
set showmatch
set autoindent
set smartindent
set cindent
set cursorline
set modeline
set number
set laststatus=2
set backspace=2
set expandtab
set softtabstop=2
set shiftwidth=2
set lazyredraw
set wildmenu
set wildmode=longest:full,full
syntax on
filetype plugin indent  on
set suffixes=.bak,~,.swp,.o,.info,.aux,.log,.dvi,.bbl,.blg,.brf,.cb,.ind,.idx,.ilg,.inx,.out,.toc

set pastetoggle=<F4>
inoremap jj <Esc>
nmap <space> <leader>
nnoremap E $
nnoremap $ <nop>
nnoremap <Leader>w :w<CR>
nnoremap <Leader>wq :wq<CR>
nnoremap <Leader>q :q<CR>
nnoremap <Leader>Q :q!<CR>
nnoremap <Leader>n :set number!<CR>
nnoremap <Leader>h :nohl<CR>
nnoremap <Leader>k :Vex<CR>
noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l
noremap <C-w>h :vertical res -5<CR>
noremap <C-w>l :vertical res +5<CR>
noremap <C-w>j :res +5<CR>
noremap <C-w>k :res -5<CR>

" No backups, YOLO
set nobk
set nowb

" Special circumstances for reading mutt mails
"au BufNewFile,BufRead *tmp/*mutt* set ft=mail | set fo=aw | set tw=80 | set wrap | +/^--.$/-1\|+/^$/ | nohl | startinsert
au FileType mail set fo=aw tw=80 wrap | +/^$/ | startinsert

" For that Explorer goodness
let g:netrw_liststyle=3

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
