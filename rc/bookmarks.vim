let g:bookmark_sign = ''
let g:bookmark_annotation_sign = ''
let g:bookmark_show_warning = 0
let g:bookmark_show_toggle_warning = 0
let g:bookmark_center = 1
let g:bookmark_auto_close = 1
let g:bookmark_save_per_working_dir = 1
let g:bookmark_manage_per_buffer = 1
let g:bookmark_no_default_key_mappings = 1

nmap <Leader>mm  <Plug>BookmarkToggle
nmap <Leader>mi  <Plug>BookmarkAnnotate
nmap <Leader>ma  <Plug>BookmarkShowAll
nmap <Leader>mn  <Plug>BookmarkNext
nmap <Leader>mp  <Plug>BookmarkPrev
nmap <Leader>mc  <Plug>BookmarkClear
nmap <Leader>mx  <Plug>BookmarkClearAll
nmap <Leader>mkk <Plug>BookmarkMoveUp
nmap <Leader>mjj <Plug>BookmarkMoveDown
nmap <Leader>mg  <Plug>BookmarkMoveToLine

" Finds the Git super-project directory.

function! g:BMWorkDirFileLocation()
  let l:filename = 'bookmarks'
  let l:location = ''
  if isdirectory('.git')
    " Current work dir is git's work tree
    let l:location = getcwd().'/.git'
  else
    " Look upwards (at parents) for a directory named '.git'
    let l:location = finddir('.git', '.;')
  endif
  if len(l:location) > 0
    return l:location . '/' . l:filename
  else
    return getcwd() . '/.' . l:filename
  endif
endfunction

" Finds the Git super-project directory based on the file passed as an argument.

function! g:BMBufferFileLocation(file)
  let l:filename = 'vim-bookmarks'
  let l:location = ''
  if isdirectory(fnamemodify(a:file, ':p:h') . '/.git')
    " Current work dir is git's work tree
    let l:location = fnamemodify(a:file, ':p:h') . '/.git'
  else
    " Look upwards (at parents) for a directory named '.git'
    let l:location = finddir('.git', fnamemodify(a:file, ':p:h') . '/.;')
  endif
  if len(l:location) > 0
    return simplify(l:location . '/.' . l:filename)
  else
    return simplify(fnamemodify(a:file, ':p:h') . '/.' . l:filename)
  endif
endfunction
