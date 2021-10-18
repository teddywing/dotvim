if exists('b:did_ftplugin')
	unlet b:did_ftplugin
endif

setlocal nocursorline

highlight todoUndone ctermbg=220 ctermfg=235
highlight todoUnimportant ctermfg=7


" Use <Space> as an additional Leader
nmap <buffer> <Space> <Leader>
