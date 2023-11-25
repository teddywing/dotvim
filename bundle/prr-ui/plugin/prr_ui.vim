if exists('g:loaded_prr_ui')
	finish
endif
let g:loaded_prr_ui = 1

command! PrrStart execute 'vsplit ' . system('prr-start --print')
command! PrrSubmit !prr-submit
