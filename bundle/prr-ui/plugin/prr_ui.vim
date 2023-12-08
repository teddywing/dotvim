if exists('g:loaded_prr_ui')
	finish
endif
let g:loaded_prr_ui = 1

command! PrrStart call prr_ui#StartInteractive()
command! PrrSubmit call prr_ui#Submit()
command! PrrComment call prr_ui#Comment()
