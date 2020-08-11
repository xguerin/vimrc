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
    autocmd FileType c,cpp,ocaml,rust call SetLSPShortcuts()
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

    " Snakemake
    au BufNewFile,BufRead Snakefile setl syntax=python ts=2 et sts=2 sw=2 foldmethod=indent comments=:#

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
    autocmd FileType ocaml setl commentstring=(*\ %s\ *)
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
    autocmd Filetype ocaml,c,cpp,javascript,rust setl signcolumn=yes
  augroup end
  "
  " Other languages
  "
  augroup LANG
    au!

    autocmd FileType sh,rc,asm,s,S,ruby,json,lua,python,ocaml,minimal,perl,sql,ragel,spl setl formatoptions=croql number
    autocmd FileType sh,rc,asm,s,S,ruby,json,lua,python,ocaml,minimal,perl,sql,ragel,spl setl autoindent

    autocmd FileType markdown setl ts=4 sts=4 sw=4
    autocmd FileType minimal setl noet tw=100
    autocmd FileType yaml setl ts=2 sts=2 sw=2
    autocmd FileType c,cpp,ocaml setl ts=2 sts=2 sw=2 tw=80
    autocmd FileType tex setl ts=4 sts=4 sw=4 tw=80 autoindent number

    if ! &diff
      autocmd FileType sh,rc,ruby,lua,python,ocaml,minimal,ragel,perl,tex,markdown,spl call EnableHighlightEOL()
    end

    autocmd FileType json setl foldmethod=syntax comments=://
    autocmd FileType minimal setl syntax=minimal foldmethod=indent comments=:#
    autocmd FileType perl setl syntax=perl foldmethod=indent comments=:#
    autocmd FileType ragel setl syntax=ragel foldmethod=indent comments=:#
    autocmd FileType ruby setl syntax=ruby foldmethod=indent comments=:#
    autocmd FileType sh,rc setl syntax=zsh foldmethod=indent comments=:#
    autocmd FileType spl setl smartindent foldmethod=indent comments=://

    autocmd FileType tex setl foldmethod=indent
    autocmd FileType rl setl number

    autocmd FileType lua setl foldmethod=indent comments=:--
    autocmd FileType python setl et foldmethod=indent comments=:#

    autocmd FileType ocaml setl et foldmethod=indent comments=sr:(*,mb:*,el:*)
    autocmd FileType make setl noet

    autocmd FileType ocaml set omnifunc=lsp#complete
    autocmd FileType ocaml,perl inoremap <C-Space> <C-x><C-o>
    autocmd FileType ocaml,perl inoremap <C-@> <C-x><C-o>
  augroup end
  "
  " Markup
  "
  augroup MARKUP
    autocmd FileType markdown,yaml setl number cole=2
  augroup end
  "
  " C family of languages
  "
  augroup CFAMILY
    au!

    autocmd FileType c,cpp,cc,h,hpp,javascript,objc,rust setl cindent smartindent autoindent formatoptions=croql number
    autocmd FileType rust setl ts=2 sts=2 sw=2 tw=80

    if ! &diff
      autocmd FileType c,cpp,cc,h,hpp,javascript,rust call EnableHighlightEOL()
      autocmd FileType c,cpp,cc,h,hpp ClangFormatAutoEnable
    end

    autocmd FileType cpp,hpp setl formatoptions=croqlj cino=N-s,t0,g0,(0,l1 foldmethod=syntax
    autocmd FileType c,h setl cino=l1,t0,g0,(0 formatoptions=tcqlron foldmethod=syntax

    autocmd FileType rust setl foldmethod=syntax

    autocmd FileType c,cpp,rust set omnifunc=lsp#complete
    autocmd FileType c,cpp,rust inoremap <C-Space> <C-x><C-o>
    autocmd FileType c,cpp,rust inoremap <C-@> <C-x><C-o>
  augroup end

endif
