set spellfile=~/.vim/dictionary.utf-8.add
let w:spellcheck = ''

function! ToggleSpellCheck(locale)
  let w:spellcheck = exists('w:spellcheck') ? w:spellcheck : 0
  if w:spellcheck ==# '' || w:spellcheck != a:locale
    execute 'set spell spelllang=' . a:locale
    let w:spellcheck = a:locale
    echo 'SpellCheck ' . a:locale . ' enabled'
  else
    set nospell
    let w:spellcheck = ''
    echo 'SpellCheck disabled'
  endif
endfunction

map <silent> <Leader>e :call ToggleSpellCheck("en_us")<CR>
map <silent> <Leader>f :call ToggleSpellCheck("fr")<CR>


