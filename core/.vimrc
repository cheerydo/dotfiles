" Vi is right out - this is VIM
set nocompatible

" Vim-plug awesomeness
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
Plug 'romainl/Apprentice'
Plug 'itchyny/lightline.vim'
Plug 'itchyny/calendar.vim'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'junegunn/goyo.vim'
Plug 'scrooloose/nerdtree'
Plug 'vimperator/vimperator.vim'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-markdown'
Plug 'jamessan/vim-gnupg'
call plug#end()

colorscheme apprentice

" And the rest
set backspace=2
set cursorline
set incsearch
set lazyredraw
set modeline
set relativenumber
set nohlsearch
set ruler
set showmatch
set showcmd
set splitbelow
set splitright
set title
set titlestring="vim %f"
let &titleold=getcwd()

" No backups, YOLO
set nobackup
set nowritebackup
set noundofile

" History and vimfile specs
set history=50
set viminfo+=n~/.vim/viminfo

" Key timeouts for commands in ms
set timeoutlen=500

" Demote suffixes we don't want to see in file searching
set suffixes=.bak,~,.swp,.o,.info,.aux,.log,.dvi,.bbl,.blg,.brf,.cb,.ind,.idx,.ilg,.inx,.out,.toc

" Tabs are spaces always please
set expandtab
set softtabstop=2
set shiftwidth=2

" I never quite remember what these do but they're staying
set wildmenu
set wildmode=longest:full,full

" Use Xorg buffer as default
set clipboard=unnamed

" Use 1 column to margin of folds
set foldcolumn=1

" Gotta have my syntax and filetype helps
syntax on
filetype plugin indent  on

" For that Explorer goodness
let g:netrw_liststyle=3

" Special circumstances for reading mutt mails
au FileType mail setlocal fo=tawcql tw=0 wm=0 wrap | +/^$/+1 | startinsert

" Keymappings for your health
nmap <space> <leader>
" Puts cursor at last used insert position after exiting insert mode
inoremap fd <Esc>'^
nnoremap E $
nnoremap $ <nop>
nnoremap <Leader>w :w<CR>
nnoremap <Leader>wq :wq<CR>
nnoremap <Leader>q :q<CR>
nnoremap <Leader>Q :q!<CR>
nnoremap <Leader>nu :set number!<CR>
nnoremap <Leader>hi :nohl<CR>
nnoremap <Leader>k :Vex<CR>
set pastetoggle=<F4>

" Window nav with resize
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
nnoremap <C-w>h :vertical res -5<CR>
nnoremap <C-w>l :vertical res +5<CR>
nnoremap <C-w>j :res +5<CR>
nnoremap <C-w>k :res -5<CR>

" Quick splits
nnoremap <Leader>sv :vne<CR>
nnoremap <Leader>sh :new<CR>

" Tab navigation
nnoremap <Leader>, :tabnext<CR>
nnoremap <Leader>. :tabprevious<CR>
nnoremap <Leader>b :tabedit<Space>
nnoremap <Leader>B :tabnew<CR>
nnoremap <Leader>x :tabclose<CR>

" Zen mode for writing
nnoremap <Leader>wr :tabe +Goyo<Space>

map <F10> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
      \ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
      \ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>

""" Plugin settings """
" Statusline times
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

" CtrlP
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'c'
let g:ctrlp_show_hidden = 1 " Show me the dotfiles!
