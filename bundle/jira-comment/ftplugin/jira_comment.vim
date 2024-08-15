if exists("b:did_ftplugin")
	finish
endif
let b:did_ftplugin = 1


nnoremap <silent> <buffer> Zy :set operatorfunc=jira_comment#PostComment<CR>g@
nnoremap <silent> <buffer> Zyy :<C-u>call jira_comment#PostOneLineComment()<CR>
nnoremap <silent> <buffer> Zp :set operatorfunc=jira_comment#PostPublicComment<CR>g@
nnoremap <silent> <buffer> Zpp :<C-u>call jira_comment#PostPublicOneLineComment()<CR>

command! -range=% JiraPostComment <line1>,<line2>write !jira-comment


inoremap <buffer> <C-x><C-u> <C-r>=jira_comment#ContactComplete()<CR>
