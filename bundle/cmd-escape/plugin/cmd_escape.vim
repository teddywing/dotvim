let s:active = 0

function! s:Activate()
	cnoremap <Space> \<Space>
	let s:active = 1
endfunction

function! s:Deactivate()
	cunmap <Space>
	let s:active = 0
endfunction

function s:Toggle()
	if s:active
		cunmap <Space>
		let s:active = 0
	else
		cnoremap <Space> \<Space>
		let s:active = 1
	endif

	return ''
endfunction

cnoremap <C-x><Space> <C-r>=<SID>Toggle()<CR>
