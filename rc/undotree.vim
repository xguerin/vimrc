let g:undotree_WindowLayout = 4

if has("persistent_undo")
  if has("nvim")
    set undodir=~/.undodir/nvim/
  else
    set undodir=~/.undodir/vim/
  endif
  set undofile
endif

noremap <Leader>u :UndotreeToggle<CR>
