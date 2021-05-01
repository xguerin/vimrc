" Fugitive head memoization

let b:git_head = ''

function! GetGitHead()
  if exists('*fugitive#head')
    let b:git_head = fugitive#head()
  endif
endfunction

" LSP

function SetLSPShortcuts()
  nnoremap <localleader>t :LspDeclaration<CR>
  nnoremap <localleader>d :LspDefinition<CR>
  nnoremap <localleader>r :LspRename<CR>
  nnoremap <localleader>h :LspHover<CR>
  nnoremap <localleader>[ :LspNextDiagnostic<CR>
  nnoremap <localleader>] :LspPreviousDiagnostic<CR>
endfunction()

" Only do this part when compiled with support for autocommands.

if has('autocmd')
  "
  " GUI augroup
  "
  if has('gui_running')
    augroup GUI
      au!
      autocmd! GUIEnter * set vb t_vb=
    augroup END
  end
  "
  " Diff augroup
  "
  if ! &diff
    augroup NOTDIFF
      au!
      " Git head
      "
      " Read git head only once, otherwise LightLine looses it and makes the whole
      " process painfully slow. Downside: if the branch changes underneath, the
      " editor won't be aware of it.
      "
      autocmd BufEnter * call GetGitHead()
    augroup end
  end
  "
  " Auto close the QF window
  "
  aug QFCLOSE
    au!
    au WinEnter * if winnr('$') == 1 && getbufvar(winbufnr(winnr()), "&buftype") == "quickfix"|q|endif
  aug end
  "
  " LSP
  "
  augroup LSP
    autocmd!
    autocmd FileType c,cpp,ocaml,python,rust call SetLSPShortcuts()
    "
    " OCaml LSP server
    "
    if executable('ocamllsp')
      au User lsp_setup call lsp#register_server({
            \ 'name': 'ocamllsp',
            \ 'cmd': {server_info->['ocamllsp']},
            \ 'whitelist': ['ocaml'],
            \ })
    endif
  augroup END
  "
  " Default formats for any filetypes
  "
  aug DEFAULT
    au!
    autocmd FileType * setl formatoptions=tcql nonumber wrap nocindent tw=80 ts=2 sts=2 sw=2 nowrap
    autocmd FileType * setl smarttab expandtab
    autocmd FileType * setl nolisp
    autocmd FileType * call DisableHighlightEOL()

    " Set wrap for mail
    autocmd FileType mail setl wrap

    " Disable signcolumn
    autocmd FileType * setl signcolumn=auto
  aug end
  "
  " Commenter
  "
  augroup COMMENTS
    au!
    autocmd FileType json setl comments=://
    autocmd FileType lua setl comments=:--
    autocmd FileType minimal setl comments=:#
    autocmd FileType ocaml setl comments=sr:(*,mb:*,el:*) commentstring=(*\ %s\ *)
    autocmd FileType python setl comments=:#
    autocmd FileType ragel setl comments=:#
    autocmd FileType ruby setl comments=:#
    autocmd FileType sh,rc setl comments=:#
    autocmd FileType vim setl comments=:\"
  augroup end
  "
  " Tags
  "
  augroup TAGS
    au!
    autocmd Syntax * call matchadd('Todo',  '\W\zs\(TODO\|FIXME\|CHANGED\|XXX\|BUG\|HACK\)')
    autocmd Syntax * call matchadd('Debug', '\W\zs\(NOTE\|INFO\|IDEA\)')
  augroup end
  "
  " Sign column
  "
  augroup SIGNS
    autocmd Filetype ocaml,c,cpp,javascript,rust,vim setl signcolumn=yes
  augroup end
  "
  " Other languages
  "
  augroup LANG
    au!

    autocmd FileType sh,rc,asm,s,S,ruby,json,lua,python,ocaml,minimal,spl,sql,ragel,vim setl formatoptions=croql
    autocmd FileType sh,rc,asm,s,S,ruby,json,lua,python,ocaml,minimal,spl,sql,ragel,vim setl autoindent

    autocmd FileType minimal setl noet tw=100 number
    autocmd FileType c,cpp,ocaml,spl setl ts=2 sts=2 sw=2 tw=80 number
    autocmd FileType python setl ts=2 sts=2 sw=2 tw=100 number
    autocmd FileType tex setl ts=4 sts=4 sw=4 tw=80 autoindent
    autocmd FileType vim setl ts=2 sts=2 sw=2

    if ! &diff
      autocmd FileType sh,rc,ruby,lua,python,ocaml,minimal,ragel,spl,tex,markdown call EnableHighlightEOL()
    end

    autocmd FileType json setl foldmethod=syntax
    autocmd FileType minimal setl foldmethod=indent
    autocmd FileType ragel setl foldmethod=indent
    autocmd FileType ruby setl foldmethod=indent
    autocmd FileType sh,rc setl number foldmethod=indent

    autocmd FileType tex setl foldmethod=indent
    autocmd FileType rl setl

    autocmd FileType lua setl foldmethod=indent
    autocmd FileType python setl et foldmethod=indent

    autocmd FileType ocaml setl et
    autocmd FileType make setl noet

    autocmd FileType ocaml set omnifunc=lsp#complete
    autocmd FileType ocaml,python inoremap <C-Space> <C-x><C-o>
    autocmd FileType ocaml,python inoremap <C-@> <C-x><C-o>
  augroup end
  "
  " Markup
  "
  augroup MARKUP
    autocmd FileType markdown,yaml setl number cole=2
    autocmd FileType markdown setl ts=2 sts=2 sw=2
    autocmd FileType yaml setl ts=2 sts=2 sw=2 foldmethod=indent
  augroup end
  "
  " C family of languages
  "
  augroup CFAMILY
    au!

    autocmd FileType c,cpp,cc,h,hpp,javascript,rust setl cindent smartindent autoindent formatoptions=croql
    autocmd FileType rust setl ts=2 sts=2 sw=2 tw=80

    if ! &diff
      autocmd FileType c,cpp,cc,h,hpp,javascript,rust call EnableHighlightEOL()
      autocmd FileType c,cpp,cc,h,hpp ClangFormatAutoEnable
    end

    autocmd FileType cpp,hpp setl formatoptions=croqlj cino=N-s,t0,g0,(0,l1 foldmethod=syntax
    autocmd FileType c,h setl cino=l1,t0,g0,(0 formatoptions=tcqlron foldmethod=syntax

    autocmd FileType c,h,cpp,hpp call matchadd('Structure', '\W\zs\(PACKED\|USED\|UNUSED\)')

    autocmd FileType rust setl foldmethod=syntax

    autocmd FileType c,cpp,rust set omnifunc=lsp#complete
    autocmd FileType c,cpp,rust inoremap <C-Space> <C-x><C-o>
    autocmd FileType c,cpp,rust inoremap <C-@> <C-x><C-o>
  augroup end

endif
