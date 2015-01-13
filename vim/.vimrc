set nocompatible
colorscheme darkspectrum
"set term=xterm-256
set background=dark

set history=50
set ruler
set viminfo+=n/home/jared/.vim/viminfo
set incsearch
set modeline
set cindent
set autoindent

" Suffixes that get lower priority when doing tab completion for filenames.
" These are files we are not likely to want to edit or read.
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

" Some keymappings
imap jj <Esc>
map <C-h> :nohl<CR>
