function! FoldOverview()
  let lines_count = v:foldend - v:foldstart + 1
  if &filetype == 'c' || &filetype == 'cpp' || &filetype == 'rust' || &filetype == 'json'
    let lines_count_text = printf(" %d lines ", lines_count)
    return getline(v:foldstart) . lines_count_text . trim(getline(v:foldend))
  else
    let lines_count_text = printf(" - %d lines", lines_count)
    return getline(v:foldstart) . lines_count_text
  end
endfunction

function! NeatFoldText()
  let foldchar = matchstr(&fillchars, 'fold:\zs.')
  let indent  = strwidth(getline(v:foldstart)) - 1
  let foldtextstart = strpart(FoldOverview(), 0, (winwidth(0)*2)/3)
  let foldtextlength = strlen(substitute(foldtextstart, '.', 'x', 'g')) + &foldcolumn
  return foldtextstart . repeat(foldchar, winwidth(0) - foldtextlength)
endfunction

set foldlevelstart=1
set foldtext=NeatFoldText()

let g:ocaml_folding = 1
let g:c_no_comment_fold = 1
