if exists('g:loaded_cmd_escape')
	finish
endif
let g:loaded_cmd_escape = 1

cnoremap <C-x><Space> <C-r>=cmd_escape#Toggle()<CR>
