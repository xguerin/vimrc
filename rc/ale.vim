let g:ale_sign_column_always = 0
let g:ale_sign_error = ''
let g:ale_sign_warning = ''

let g:ale_open_list = 0

let g:ale_set_loclist = 1
let g:ale_set_quickfix = 0

let g:ale_linters = {
      \   'perl': ['perl', 'perlcritic'],
      \}

highlight link ALEError cError
highlight link ALEWarning cWarning

highlight ALEWarningSign ctermbg=18 ctermfg=8 guibg=#393939 guifg=yellow
highlight ALEErrorSign ctermbg=18 ctermfg=8 guibg=#393939 guifg=red
