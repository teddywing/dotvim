if exists('g:loaded_diff_corrections')
	finish
endif
let g:loaded_diff_corrections = 1


augroup diff_corrections
	autocmd!

	autocmd BufEnter * call diff_corrections#Run()
augroup END


set tabpagemax=200
