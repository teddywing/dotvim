if exists('g:loaded_date')
	finish
endif
let g:loaded_date = 1

command! -nargs=? DateInsert call date#Insert(<q-args>)
