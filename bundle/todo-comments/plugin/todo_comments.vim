if exists('g:loaded_todo_comments')
	finish
endif
let g:loaded_todo = 1


nnoremap <silent> <Plug>(todo-comments-previous) :<C-u>call todo_comments#PreviousTODO()<CR>
nnoremap <silent> <Plug>(todo-comments-next) :<C-u>call todo_comments#NextTODO()<CR>


if !hasmapto('<Plug>(todo-comments-previous)', 'n') && !maparg('[t', 'n')
	nmap [t <Plug>(todo-comments-previous)
endif

if !hasmapto('<Plug>(todo-comments-next)', 'n') && !maparg(']t', 'n')
	nmap ]t <Plug>(todo-comments-next)
endif
