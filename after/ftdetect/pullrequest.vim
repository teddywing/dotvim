" Override the 'pullrequest' syntax, restoring 'gitcommit' to get proper diff
" highlighting.
autocmd BufRead,BufNewFile PULLREQ_EDITMSG  set filetype=pullrequest syntax=gitcommit
