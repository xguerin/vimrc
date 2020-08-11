set completeopt-=preview
let g:asyncomplete_auto_popup = 0

let g:lsp_signs_error = {'text': '' }
let g:lsp_signs_hint = {'text': '' }
let g:lsp_signs_information = {'text': '' }
let g:lsp_signs_warning = {'text': '' }
let g:lsp_diagnostics_echo_cursor = 0
let g:lsp_diagnostics_float_cursor = 1
let g:lsp_virtual_text_enabled = 0

let g:lsp_settings = {
      \  'clangd': {
      \    'cmd': [
      \      '/usr/local/opt/llvm/bin/clangd',
      \      '--compile-commands-dir=build',
      \      '--all-scopes-completion',
      \      '--pch-storage=memory',
      \      '-j=6'
      \   ],
      \  },
      \}

let g:lsp_settings_c = 'clangd'
let g:lsp_settings_rust = 'ra_lsp_server'
