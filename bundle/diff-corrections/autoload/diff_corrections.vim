function! diff_corrections#Run()
	if &diff
		if exists('g:colors_name') && g:colors_name ==# 'twilight256'
			highlight Comment ctermfg=7
		endif

		set nocursorline
	endif
endfunction
