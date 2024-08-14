if exists("b:did_ftplugin")
	finish
endif
let b:did_ftplugin = 1


nnoremap <silent> <buffer> Zy :set operatorfunc=jira_comment#PostComment<CR>g@
