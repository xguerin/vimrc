let g:fzf_command_prefix = 'Fzf'
let g:fzf_layout = { 'down': '40%' }
let g:fzf_preview_window = []

noremap <Leader>r :FzfHistory<CR>
noremap <Leader>f :FzfGFiles<CR>
noremap <Leader>F :FzfFiles<CR>
noremap <Leader>t :FzfRg<CR>
noremap <C-p> :FzfBuffers<CR>
