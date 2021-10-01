" Insert the current date in the format "2021.10.01" after the cursor.
function! date#Insert(separator)
	let separator = '.'

	if a:separator != ''
		let separator = a:separator
	endif

	let date = strftime('%Y' . separator . '%m' . separator . '%d')

	execute 'normal! a' . date . "\<Esc>"
endfunction
