function! SplitMethodChainToMultipleLines()
	normal! m`

	let line = getline('.')
	let indent = matchstr(line, '\v^\s+')

	" Replace '.' with newlines and the correct amount of indentation
	substitute/\V./\='

	" Indent new lines
	'`+1,.>
endfunction