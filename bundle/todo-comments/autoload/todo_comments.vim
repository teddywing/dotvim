function! s:MoveToTODO(search_flags)
	let cnt = v:count1
	normal! m'

	let i = 0
	while i < cnt
		call search('TODO', a:search_flags)

		let i += 1
	endwhile
endfunction

function! todo_comments#NextTODO()
	call s:MoveToTODO('')
endfunction

function! todo_comments#PreviousTODO()
	call s:MoveToTODO('b')
endfunction
