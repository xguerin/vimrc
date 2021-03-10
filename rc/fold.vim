function! FoldOverview()
  if &filetype == 'c' || &filetype == 'cpp' || &filetype == 'rust' || &filetype == 'json'
    return getline(v:foldstart) . trim(getline(v:foldend))
  else
    return getline(v:foldstart)
  end
endfunction

function! NeatFoldText()
  let line = '─┤ ' . substitute(FoldOverview(), '^\s*"\?\s*\|\s*"\?\s*{{' . '{\d*\s*', '', 'g') . ' ├'
  let lines_count = v:foldend - v:foldstart + 1
  let lines_count_text = '┤ ' . printf("%10s", lines_count . ' lines') . ' ├'
  let foldchar = matchstr(&fillchars, 'fold:\zs.')
  let foldtextstart = strpart(repeat('─', (v:foldlevel - 1)) . line, 0, (winwidth(0)*2)/3)
  let foldtextend = lines_count_text . repeat(foldchar, 8)
  let foldtextlength = strlen(substitute(foldtextstart . foldtextend, '.', 'x', 'g')) + &foldcolumn
  return foldtextstart . repeat(foldchar, winwidth(0)-foldtextlength) . foldtextend
endfunction

set foldlevelstart=0
set foldtext=NeatFoldText()

let g:ocaml_folding = 1
let g:c_no_comment_fold = 1
