augroup diff_corrections
	autocmd!

	autocmd BufEnter * if &diff
		\| highlight Comment ctermfg=7
		\| set nocursorline
	\| endif
augroup END
