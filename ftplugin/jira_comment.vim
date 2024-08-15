if exists('b:did_ftplugin')
	unlet b:did_ftplugin
endif

nnoremap <leader>tr :call transcribe#Transcribe()<CR>
