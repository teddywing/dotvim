if exists('g:loaded_diff_corrections') || !has('lambda')
	finish
endif
let g:loaded_diff_corrections = 1


augroup diff_corrections
	autocmd!

	" https://vi.stackexchange.com/questions/12847/automatically-disable-cursorline-when-in-diff-mode/12852#12852
	if has('patch-8.0.0736')
		autocmd OptionSet diff call diff_corrections#Run()
	else
		autocmd BufEnter,FilterWritePost * call diff_corrections#Run()
	endif
augroup END


set tabpagemax=200
