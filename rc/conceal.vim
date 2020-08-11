function! ToggleConcealLevel()
  let w:conceal = exists('w:conceal') ? w:conceal : -1
  if &conceallevel == 1 || &conceallevel == 2
    set conceallevel=0
    echo 'Reveal'
  else
    set conceallevel=2
    echo 'Conceal'
  endif
endfunction

map <silent> <Leader>cl :call ToggleConcealLevel()<CR>


