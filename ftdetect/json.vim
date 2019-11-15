if v:version < 800
	autocmd BufRead,BufNewFile *.json  set filetype=json syntax=javascript
endif
