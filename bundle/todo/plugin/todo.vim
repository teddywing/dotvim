if exists('g:loaded_todo')
	finish
endif
let g:loaded_todo = 1


nnoremap [t :call todo#PreviousTODO()<CR>
nnoremap ]t :call todo#NextTODO()<CR>
