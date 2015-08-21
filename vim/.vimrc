set          nocompatible
colorscheme  eclm_wombat_wip
set          history=50
set          ruler
set          showcmd
set          viminfo+=n/home/jared/.vim/viminfo
set          incsearch
set          nohlsearch
set          showmatch
set          autoindent
set          smartindent
set          cindent
set          cursorline
set          modeline
set          laststatus=2
set          statusline=%f\ %y\ [%m]%=\ line:\ %l\ of\ %L\ (%P)
set          backspace=indent,eol,start
set          expandtab
set          softtabstop=2
set          shiftwidth=2
set          lazyredraw
set          wildmenu
set          wildmode=longest,list
syntax       on
filetype     plugin                              indent  on
set suffixes=.bak,~,.swp,.o,.info,.aux,.log,.dvi,.bbl,.blg,.brf,.cb,.ind,.idx,.ilg,.inx,.out,.toc

set       pastetoggle=<F4>
inoremap  jj                <Esc>
nmap      <space>           <leader>
nnoremap  E                 $
nnoremap  $                 <nop>
nnoremap  <Leader>w         :w<CR>
nnoremap  <Leader>wq        :wq<CR>
nnoremap  <Leader>q         :q<CR>
nnoremap  <Leader>Q         :q!<CR>
nnoremap  <Leader>c         :set cursorline!<CR>
nnoremap  <Leader>n         :set number!<CR>
nnoremap  <Leader>h         :nohl<CR>
nnoremap  <Leader>p         :set paste!<CR>
noremap   <C-h>             <C-w>h
noremap   <C-j>             <C-w>j
noremap   <C-k>             <C-w>k
noremap   <C-l>             <C-w>l

" No backups, YOLO
set nobackup
set nowritebackup

" Special circumstances for reading mutt mails
au BufNewFile,BufRead *tmp/mutt* set ft=mail | set fo=aw | set tw=0 | set wrap | +/^--.$/-1 | nohl | startinsert
