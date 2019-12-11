let s:active = 0

" Toggles the <Space> key between normal self-insert and inserting an escaped
" space ('\ ') in command mode.
function cmd_escape#Toggle()
	if s:active
		cunmap <Space>
		let s:active = 0
	else
		cnoremap <Space> \<Space>
		let s:active = 1
	endif

	return ''
endfunction
