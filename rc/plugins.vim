" Plugins

call plug#begin('~/.vim/plugged')

" Language support

Plug 'dccmx/vim-lemon-syntax'
Plug 'lifepillar/pgsql.vim'
Plug 'neapel/vim-bnfc-syntax', { 'for': [ 'bnfc' ] }
Plug 'rhysd/vim-clang-format', { 'for': [ 'c', 'cpp' ] }
Plug 'sheerun/vim-polyglot'
Plug 'rust-lang/rust.vim'
Plug 'vim-scripts/ebnf.vim', { 'for': [ 'ebnf' ] }
Plug 'wannesm/wmgraphviz.vim', { 'for': 'dot' }

" Tools

Plug 'Keithbsmiley/investigate.vim'
Plug 'MattesGroeger/vim-bookmarks'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'junegunn/vim-easy-align'
Plug 'junegunn/vim-oblique'
Plug 'junegunn/vim-pseudocl'
Plug 'kristijanhusak/vim-carbon-now-sh'
Plug 'mbbill/undotree'
Plug 'moll/vim-bbye'
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/async.vim'
Plug 'prabirshrestha/vim-lsp'
Plug 'prabirshrestha/asyncomplete-lsp.vim'
Plug 'mattn/vim-lsp-settings'
Plug 'sbdchd/neoformat'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-projectionist'
Plug 'tpope/vim-repeat'
Plug 'vim-scripts/Casetrate'
Plug 'vim-utils/vim-man'
Plug 'w0rp/ale', { 'for': [ 'perl', 'python' ] }

" UI

Plug 'airblade/vim-gitgutter'
Plug 'chriskempson/base16-vim'
Plug 'christoomey/vim-tmux-navigator'
Plug 'xguerin/lightline.vim'
Plug 'ryanoasis/vim-devicons'
Plug 'vimtaku/hl_matchit.vim'

"

call plug#end()
