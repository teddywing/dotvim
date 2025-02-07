" Comment string
setlocal commentstring=//\ %s


nmap <buffer> Zf :!dart format %<CR>


" Hot reload on save.
autocmd BufWritePost <buffer> call <SID>HotReload()


if exists('*s:HotReload')
	finish
endif

function! s:HotReload()
	let flutter_pid = system('cat /tmp/flutter.pid')
	if flutter_pid[:-2] ==# 'cat: /tmp/flutter.pid: No such file or directory'
		redraw
		echohl WarningMsg
		echon 'Flutter not running'
		echohl None
		sleep 2

		return
	endif

	silent execute '!kill -SIGUSR1 ' . shellescape(flutter_pid)
endfunction
