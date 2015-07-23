function! git_blamer#Blame()
	let l:line_number = line('.')
	let l:buffer_name = shellescape(bufname('%'))
	let l:window_number = winnr()
	
	setlocal scrollbind cursorbind
	let t:git_blamer_restore = 'call setwinvar(' . l:window_number . ', "&scrollbind", 0) | 
		\ call setwinvar(' . l:window_number . ', "&cursorbind", 0)'
	
	" Open new window
	vnew
	setlocal noswapfile nowrap nolist nobuflisted buftype=nofile bufhidden=wipe
	setlocal scrollbind cursorbind
	
	" Read in `git blame` output
	execute 'read !git blame ' . l:buffer_name
	
	" Delete empty first line
	1 delete
	
	setlocal nomodified nomodifiable
	
	" Move cursor to position in starting file
	call setpos('.', [0, l:line_number, 0, 0])
	
	" Restore starting file's scrollbind on exit
	autocmd BufWinLeave <buffer> execute t:git_blamer_restore
endfunction
