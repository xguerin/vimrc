set completeopt-=preview
let g:asyncomplete_auto_popup = 0

let g:lsp_diagnostics_echo_cursor = 0
let g:lsp_diagnostics_float_cursor = 1
let g:lsp_diagnostics_signs_error = {'text': '●❱' }
let g:lsp_diagnostics_signs_hint = {'text': '●❱' }
let g:lsp_diagnostics_signs_information = {'text': '●❱' }
let g:lsp_diagnostics_signs_priority = 11
let g:lsp_diagnostics_signs_warning = {'text': '●❱' }

let g:lsp_document_code_action_signs_priority = 11
let g:lsp_document_code_action_signs_hint = {'text': '●❱' }

let g:lsp_virtual_text_enabled = 0

let g:lsp_settings = {
      \  'clangd': {
      \    'cmd': [
      \      'clangd',
      \      '--background-index',
      \      '--clang-tidy',
      \      '--compile-commands-dir=build',
      \      '--pch-storage=memory',
      \      '--header-insertion=never',
      \      '-j=6',
      \     ],
      \  },
      \  'pyls': {
      \    'workspace_config': {
      \      'pyls': {
      \        'plugins': {
      \          'pylint': {
      \            'enabled': v:true,
      \          },
      \          'rope_completion': {
      \            'enabled': v:true
      \          },
      \          'rope_rename': {
      \            'enabled': v:true
      \          }
      \        }
      \      }
      \    }
      \  }
      \}

let g:lsp_settings_filetype_c = 'clangd'
let g:lsp_settings_filetype_python = 'pyls'
let g:lsp_settings_filetype_rust = 'ra_lsp_server'
let g:lsp_settings_enable_suggestions = 0

" Highlights

highlight LspCodeActionText   ctermbg=18 ctermfg=6  guibg=#393939 guifg=blue
highlight LspErrorText        ctermbg=18 ctermfg=11 guibg=#393939 guifg=red
highlight LspHintText         ctermbg=18 ctermfg=8  guibg=#393939 guifg=green
highlight LspInformationText  ctermbg=18 ctermfg=8  guibg=#393939 guifg=green
highlight LspWarningText      ctermbg=18 ctermfg=12 guibg=#393939 guifg=yellow
