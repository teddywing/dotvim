function! whitespace_method_chain#SplitMethodChainToMultipleLines()
	normal! m`

	let line = getline('.')
	let indent = matchstr(line, '\v^\s+')

	" Replace '.' with newlines and the correct amount of indentation
	silent! substitute/\V./\='' . indent . '.'/g

	" Indent new lines
	silent! '`+1,.>
endfunction
