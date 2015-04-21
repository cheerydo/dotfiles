set nocompatible
colorscheme eclm_wombat

set history=50
set ruler
set showcmd
set viminfo+=n/home/jared/.vim/viminfo
set incsearch
set modeline
set cindent
set autoindent
set cursorline

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
set softtabstop=4
set expandtab
set shiftwidth=4
set smartindent
set lazyredraw
set showmatch


" Splits window to the right by default
set spr

" Sets search to work as each letter is typed
" and highlights search results
set incsearch
set hlsearch

" Save backups to .vim directory, so it's less annoying
"set backup
"set backupdir=~/.vim/bak,/var/tmp,/tmp
"set directory=~/.vim/bak,/var/tmp,/tmp
"set writebackup

" Menu settings
set wildmenu
set wildmode=longest,list


" Some keymappings
inoremap jj <Esc>
set pastetoggle=<F4>

" Remaps E to end of line rather than hard-to-reach $
nnoremap E $
nnoremap $ <nop>

"nnoremap gV `[v`]

nmap <space> <leader>
nnoremap <Leader>w :w<CR>
nnoremap <Leader>wq :wq<CR>
nnoremap <Leader>q :q<CR>
nnoremap <Leader>Q :q!<CR> 
nnoremap <Leader>c :set cursorline!<CR>
nnoremap <Leader>n :set number!<CR>
nnoremap <Leader>h :nohl<CR>

" Nice buffer navigation
noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l

au BufNewFile,BufRead ~/.mutt/.tmp/* set ft=mail:fo=aw:tw=0:wrap
