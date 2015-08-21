set nocompatible
colorscheme eclm_wombat

set history=50
set ruler
set viminfo+=n/home/jared/.vim/viminfo
set incsearch
set modeline
set cindent
set autoindent
set showcmd

" Low priority 
set suffixes=.bak,~,.swp,.o,.info,.aux,.log,.dvi,.bbl,.blg,.brf,.cb,.ind,.idx,.ilg,.inx,.out,.toc

if has('gui_running')
  " Make shift-insert work like in Xterm
  map <S-Insert> <MiddleMouse>
  map! <S-Insert> <MiddleMouse>
endif
syntax on
filetype plugin indent on

set backspace=indent,eol,start
set tabstop=4
set shiftwidth=4
set smartindent

" No backups, YOLO
set nobackup
set nowritebackup

set wildmenu
set wildmode=longest,list

au BufNewFile,BufRead /tmp/*mutt* set fo=aw tw=0

let mapleader = "\<Space>"
hi CursorLine cterm=bold
set cursorline

" Some keymappings
set pastetoggle=<F4>
imap jj <Esc>
map <C-h> :nohl<CR>

nnoremap <Leader>w :w<CR>  
nnoremap <Leader>wq :wq<CR>
nnoremap <Leader>q :q<CR>
nnoremap <Leader>Q :q!<CR>
nnoremap <Leader>c :set cursorline!<CR>
nnoremap <Leader>n :set number!<CR>
