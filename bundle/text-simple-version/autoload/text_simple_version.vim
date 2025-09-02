" Copy the last section of the file. Sections are separated by a newline
" followed by a line containing "---". This allows for very rough version
" saving of text edits.
function! text_simple_version#NewVersion()
	try
		" Copy the last entry to the bottom.
		$
		?\n---?,$t$

	" We only have a single entry (pattern not found error).
	catch /^Vim\%((\a\+)\)\?:E486: .*\\n---/
		" Add two lines to the end of the file.
		call append('$', ['', '---'])

		" Copy the only entry to the bottom.
		0,$-2t$

	finally
		" Move to the line below the separator line.
		?\n\n\zs---?
		call cursor(line('.') + 1, 0)
		normal! mq
	endtry
endfunction
