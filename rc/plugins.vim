" Plugins

call plug#begin('~/.vim/plugged')

" Language support

Plug 'bfrg/vim-cpp-modern'      , { 'for': [ 'c', 'cpp' ] }
Plug 'dccmx/vim-lemon-syntax'
Plug 'hjson/vim-hjson'          , { 'for': 'hjson' }
Plug 'jvirtanen/vim-hcl'        , { 'for': 'hcl' }
Plug 'lifepillar/pgsql.vim'
Plug 'neapel/vim-bnfc-syntax'   , { 'for': 'bnfc'}
Plug 'ocaml/vim-ocaml'          , { 'for': [ 'dune', 'ocaml' ] }
Plug 'plasticboy/vim-markdown'  , { 'for': 'markdown' }
Plug 'rust-lang/rust.vim'       , { 'for': 'rust' }
Plug 'sheerun/vim-polyglot'
Plug 'vim-scripts/ebnf.vim'     , { 'for': 'ebnf' }
Plug 'wannesm/wmgraphviz.vim'   , { 'for': 'dot' }

" Tools

Plug 'Keithbsmiley/investigate.vim'
Plug 'MattesGroeger/vim-bookmarks'
Plug 'idanarye/vim-casetrate'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'junegunn/vim-easy-align'
Plug 'junegunn/vim-oblique'
Plug 'junegunn/vim-pseudocl'
Plug 'kristijanhusak/vim-carbon-now-sh'
Plug 'mattn/vim-lsp-settings'
Plug 'mbbill/undotree'
Plug 'moll/vim-bbye'
Plug 'prabirshrestha/async.vim'
Plug 'prabirshrestha/asyncomplete-lsp.vim'
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/vim-lsp'
Plug 'sbdchd/neoformat'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-fugitive',
Plug 'tpope/vim-projectionist'
Plug 'tpope/vim-repeat'
Plug 'vim-scripts/Casetrate'
Plug 'vim-utils/vim-man'

" UI

Plug 'airblade/vim-gitgutter'
Plug 'chriskempson/base16-vim'
Plug 'christoomey/vim-tmux-navigator'
Plug 'xguerin/lightline.vim'
Plug 'vimtaku/hl_matchit.vim'

"

call plug#end()
