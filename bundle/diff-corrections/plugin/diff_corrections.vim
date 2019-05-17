augroup diff_corrections
	autocmd!

	autocmd BufEnter * call diff_corrections#Run()
augroup END


set tabpagemax=200
