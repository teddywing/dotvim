if exists('g:loaded_todo')
	finish
endif
let g:loaded_todo = 1


nnoremap <silent> <Plug>(todo-previous) :call todo#PreviousTODO()<CR>
nnoremap <silent> <Plug>(todo-next) :call todo#NextTODO()<CR>


if !hasmapto('<Plug>(todo-previous)', 'n') && !maparg('[t', 'n')
	nmap [t <Plug>(todo-previous)
endif

if !hasmapto('<Plug>(todo-next)', 'n') && !maparg(']t', 'n')
	nmap ]t <Plug>(todo-next)
endif
