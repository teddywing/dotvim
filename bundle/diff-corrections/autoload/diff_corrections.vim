let s:old_cursorline = &cursorline

function! diff_corrections#Run()
	if &diff
		if exists('g:colors_name') && g:colors_name ==# 'twilight256'
			highlight Comment ctermfg=7
		endif

		set nocursorline
	else
		if exists('g:colors_name') && g:colors_name ==# 'twilight256'
			execute 'highlight ' . s:old_highlight_comment
		endif

		let &cursorline = s:old_cursorline
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


let s:old_highlight_comment = s:SaveCommentColor()
