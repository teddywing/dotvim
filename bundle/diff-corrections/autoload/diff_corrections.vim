let s:old_cursorline = &cursorline
let s:old_wrap = &wrap
let s:restore_cx_mapping = ''


function! diff_corrections#Run()
	if &diff
		if exists('g:colors_name') && g:colors_name ==# 'twilight256'
			highlight Comment ctermfg=7
		endif

		set nocursorline
		set wrap

		nnoremap cx :<C-u>tabclose<CR>
	else
		if exists('g:colors_name') && g:colors_name ==# 'twilight256'
			execute 'highlight ' . s:old_highlight_comment
		endif

		let &cursorline = s:old_cursorline
		let &wrap = s:old_wrap

		if strlen(s:restore_cx_mapping) > 0
			execute s:restore_cx_mapping
		endif
	endif
endfunction


function! s:SaveCommentColor()
	redir => old_highlight
	silent highlight Comment
	redir END

	let parts = split(old_highlight, ' ')
	call filter(parts, {_idx, val -> val !=? "" && val !=? "xxx"})

	let restore = join(parts, ' ')

	" Remove ^@ character from the beginning that messes up the `execute` call
	return restore[1:]
endfunction


function! s:SaveMapping()
	let mapping = maparg('cx', 'n', 0, 1)

	if !empty(mapping)
		let s:restore_cx_mapping .= (mapping.noremap ? 'nnoremap' : 'nmap') .
			\ join(
				\ map(
					\ ['buffer', 'expr', 'nowait', 'silent'],
					\ 'mapping[v:val] ? "<" . v:val . ">" : ""'
				\ )
			\ ) .
			\ mapping.lhs . ' ' .
			\ substitute(mapping.rhs, '<SID>', '<SNR>' . mapping.sid . '_', 'g')
	endif
endfunction


let s:old_highlight_comment = s:SaveCommentColor()
call s:SaveMapping()
