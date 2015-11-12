function! copy#Copy(start_line, end_line)
	silent execute a:start_line . ',' . a:end_line . 'y'
	silent call system('pbcopy', getreg('@'))
endfunction
