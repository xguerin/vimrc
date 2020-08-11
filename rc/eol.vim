" End of line functions

let w:highlight = -1

function! EnableHighlightEOL()
  let &colorcolumn=&textwidth
  let w:highlight = 0
endfunction

function! DisableHighlightEOL()
  set colorcolumn=0
  let w:highlight = -1
endfunction

function! ToggleHighlightEOL()
  let w:highlight = exists('w:highlight') ? w:highlight : -1
  if w:highlight == -1
    call EnableHighlightEOL()
    echo 'EOL enabled'
  else
    call DisableHighlightEOL()
    echo 'EOL disabled'
  endif
endfunction

map <silent> <Leader>le :call ToggleHighlightEOL()<CR>

" End of line toggle

function! ToggleLineNumbers()
  if &number
    set nonumber
  else
    set number
  endif
endfunction

map <silent> <Leader>ln :call ToggleLineNumbers()<CR>
