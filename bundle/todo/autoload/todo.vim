function! todo#NextTODO()
	normal! m'
	call search('TODO')
endfunction

function! todo#PreviousTODO()
	normal! m'
	call search('TODO', 'b')
endfunction
