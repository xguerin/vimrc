let g:lightline = {
      \ 'colorscheme': 'Tomorrow_Night_Eighties',
      \ 'mode_map': { 'c': 'NORMAL' },
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ], [ 'fugitive', 'filename' ] ],
      \   'right': [ [ 'lineinfo' ], ['percent'], [ 'fileformat', 'fileencoding', 'filetype' ] ]
      \ },
      \ 'component_function': {
      \   'fugitive': 'LightLineFugitive',
      \   'filename': 'LightLineFilename',
      \   'fileformat': 'LightLineFileformat',
      \   'filetype': 'LightLineFiletype',
      \   'fileencoding': 'LightLineFileencoding',
      \   'mode': 'LightLineMode',
      \ },
      \ 'separator': { 'left': '', 'right': '' },
      \ 'subseparator': { 'left': '|', 'right': '|' },
      \ 'tabline' : { 'right' : [ [ ] ] },
      \ 'tabline_separator': { 'left': '', 'right': '' },
      \ 'tabline_subseparator': { 'left': '|', 'right': '|' }
      \ }

function! LightLineModified()
  return &filetype =~? 'help\|vimfiler\|gundo' ? '' : &modified ? '+' : &modifiable ? '' : '-'
endfunction

function! LightLineReadonly()
  return &filetype !~? 'help\|vimfiler\|gundo' && &readonly ? '' : ''
endfunction

function! LightLineFilename()
  let l:fname = expand('%:t')
  return &filetype ==? 'vimfiler' ? vimfiler#get_status_string() :
        \ &filetype ==? 'unite' ? unite#get_status_string() :
        \ &filetype ==? 'vimshell' ? vimshell#get_status_string() :
        \ ('' !=# LightLineReadonly() ? LightLineReadonly() . ' ' : '') .
        \ ('' !=# l:fname ? l:fname : '[No Name]') .
        \ ('' !=# LightLineModified() ? ' ' . LightLineModified() : '')
endfunction

function! LightLineFugitive()
  try
    if &filetype !~? 'vimfiler' && exists('*fugitive#head')
      let l:mark = ' '  " edit here for cool mark
      let l:_ = b:git_head
      return strlen(l:_) ? l:mark . l:_ : ''
    endif
  catch
  endtry
  return ''
endfunction

function! LightLineFileformat()
  return winwidth(0) > 70 ? (&fileformat . ' ' .  WebDevIconsGetFileFormatSymbol() . ' ') : ''
endfunction

function! LightLineFiletype()
  return winwidth(0) > 70 ? (strlen(&filetype) ? (&filetype . ' ' .  WebDevIconsGetFileTypeSymbol() . ' ') : 'none ') : ''
endfunction

function! LightLineFileencoding()
  return winwidth(0) > 70 ? (strlen(&fileencoding) ? &fileencoding : &encoding) : ''
endfunction

function! LightLineMode()
  let l:fname = expand('%:t')
  return l:fname ==? '__Gundo__' ? 'Gundo' :
        \ l:fname ==? '__Gundo_Preview__' ? 'Gundo Preview' :
        \ &filetype ==# 'unite' ? 'Unite' :
        \ &filetype ==# 'vimfiler' ? 'VimFiler' :
        \ &filetype ==# 'vimshell' ? 'VimShell' :
        \ winwidth(0) > 60 ? lightline#mode() : ''
endfunction
