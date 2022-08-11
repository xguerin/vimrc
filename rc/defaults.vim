" Leader overwrite

let g:mapleader = "\<Space>"

" Set the default shell

set shell=bash

" Configuration

set autoread                  " Automatically reload change
set clipboard=unnamed         " Set the system clipboard (X11)
set directory=$HOME/.vim/swap
set expandtab                 " Use soft tabs
set fileencoding=utf-8
set history=1000
set nohlsearch                " Disable persistent highlight search
set incsearch                 " Enable incremental search
set laststatus=2              " Alwaays show status line
set lazyredraw                " Don't redraw when executing macros/commands
set modeline                  " Enable modeline
set mouse=a                   " Enable mouse reporting
set nobackup                  " Disable backup files
set noerrorbells              " Disable error bells
set novisualbell              " Disable visual bell
set nowritebackup             " Disable write backup
set previewheight=20          " Set the preview height to 20 lines
set ruler                     " Show column/line position
set shiftround                " Round indent to multiple of shiftwidth
set shiftwidth=2
set showmatch
set showtabline=2             " Always show tab line
set smartcase                 " Case-sensitive search only with uppercase characters
set softtabstop=2
set t_vb=
set tabstop=2
set ttyfast
set updatetime=500
set wildmenu
set wildmode=longest,list:full

" Configure the patience diff

if has("patch-8.1.0360")
  set diffopt+=internal,algorithm:patience
endif

" No HL search

map <silent> <Leader>c <ESC>:noh<CR><ESC>

" Disable the linter while in diff

if &diff
  let g:ale_enabled = 0
  let g:lsp_diagnostics_enabled = 0
end

" Use matchit

runtime macros/matchit.vim

" Use a long dash for folding, space for diffing.

set fillchars=vert:\|,fold:\ ,diff:\ 
