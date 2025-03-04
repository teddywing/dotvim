if exists('g:loaded_chmodx')
	finish
endif
let g:loaded_chmodx = 1


command! -nargs=0 ChmodX !chmod +x %
