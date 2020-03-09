function! s:NextTODO()
	normal! m'
	call search('TODO')
endfunction

function! s:PreviousTODO()
	normal! m'
	call search('TODO', 'b')
endfunction

nnoremap [t :call <SID>PreviousTODO()<CR>
nnoremap ]t :call <SID>NextTODO()<CR>
