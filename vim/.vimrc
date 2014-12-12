set nocompatible
syntax on
filetype plugin indent on

set backspace=indent,eol,start
set tabstop=4
set shiftwidth=4
set smarttab

" No backups, YOLO
set nobackup
set nowritebackup

" For the visuals
set background=dark
set number
set modeline
colorscheme darkspectrum

set viminfo+=n/home/jared/.vim/viminfo

" Now we set some defaults for the editor
set history=50                  " keep 50 lines of command line history
set ruler                       " show the cursor position all the time

" Suffixes that get lower priority when doing tab completion for filenames.
" These are files we are not likely to want to edit or read.
set suffixes=.bak,~,.swp,.o,.info,.aux,.log,.dvi,.bbl,.blg,.brf,.cb,.ind,.idx,.ilg,.inx,.out,.toc


if has('gui_running')
  " Make shift-insert work like in Xterm
  map <S-Insert> <MiddleMouse>
  map! <S-Insert> <MiddleMouse>
endif

" Some keymappings
imap jj <Esc>
