let g:undotree_WindowLayout = 4

if has("persistent_undo")
  set undodir=~/.undodir/
  set undofile
endif

noremap <Leader>u :UndotreeToggle<CR>
