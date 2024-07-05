if exists('g:loaded_smartbar_mv3_move')
	finish
endif
let g:loaded_smartbar_mv3_move = 1


nnoremap <leader>] :call smartbar_mv3_move#MessageGo()<CR>
