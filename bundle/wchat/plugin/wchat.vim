if exists('g:loaded_wchat')
	finish
endif
let g:loaded_wchat = 1

" Write to a temporary file labelled with the current time.
command! -nargs=0 -bang WChat
	\ execute ":write\<bang> /tmp/ch" . strftime('%H%M')
