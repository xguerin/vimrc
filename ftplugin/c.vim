if has('autocmd')
  if ! &diff
    augroup FMT
      autocmd!
      autocmd BufWritePre * Neoformat
    augroup END
  end
end
