" Comment string
setlocal commentstring=//\ %s


nmap <buffer> Zf :!dart format %<CR>


" Hot reload on save.
autocmd BufWritePost <buffer>
	\ silent execute '!kill -SIGUSR1 "$(cat /tmp/flutter.pid)"'
