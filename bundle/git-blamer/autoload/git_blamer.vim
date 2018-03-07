" Open a new split with a `git blame` of the current file
" Inspired by Ben Orenstein
" https://github.com/r00k/dotfiles/blob/7874508b825fd754e4ec3259da65f324ab96c8ea/vimrc#L74

function! git_blamer#Blame()
	let l:top_line = line('w0') + &scrolloff
	let l:line_number = line('.')
	let l:buffer_name = shellescape(bufname('%'))
	let l:buffer_number = bufnr('%')

	setlocal scrollbind cursorbind

	" Open new window
	leftabove vnew

	let b:git_blamer_restore = 'call setbufvar(' . l:buffer_number . ', "&scrollbind", 0) |
		 \ call setbufvar(' . l:buffer_number . ', "&cursorbind", 0)'

	" Read in `git blame` output
	execute 'read !git blame -w ' . l:buffer_name

	" Delete empty first line
	1 delete

	setlocal nomodified nomodifiable

	" Move cursor to position in starting file
	call cursor(l:top_line, 0)
	normal! zt
	call cursor(l:line_number, 0)

	setlocal noswapfile nowrap nolist nobuflisted buftype=nofile bufhidden=wipe
	setlocal scrollbind cursorbind
	syncbind

	nnoremap <buffer> q :q<CR>

	" Restore starting file's scrollbind on exit
	autocmd BufWinLeave <buffer> execute b:git_blamer_restore
endfunction
