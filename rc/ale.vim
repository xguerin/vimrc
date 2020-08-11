let g:ale_sign_column_always = 0
let g:ale_sign_error = ''
let g:ale_sign_warning = ''
let g:ale_open_list = 0
let g:ale_set_loclist = 1
let g:ale_set_quickfix = 0

let g:ale_pattern_options = {
      \ '.*\.mly$': { 'ale_enabled': 0 },
      \ '.*\.mll$': { 'ale_enabled': 0 },
      \}

let g:ale_linters = {
      \   'perl': ['perl', 'perlcritic'],
      \}
