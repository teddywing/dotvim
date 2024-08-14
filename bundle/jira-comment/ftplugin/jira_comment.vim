if exists("b:did_ftplugin")
	finish
endif
let b:did_ftplugin = 1


nnoremap <silent> <buffer> Zy :set operatorfunc=jira_comment#PostComment<CR>g@
nnoremap <silent> <buffer> Zyy :set operatorfunc=jira_comment#PostOneLineComment<CR>g@
nnoremap <silent> <buffer> Zp :set operatorfunc=jira_comment#PostPublicComment<CR>g@
nnoremap <silent> <buffer> Zpp :set operatorfunc=jira_comment#PostPublicOneLineComment<CR>g@
