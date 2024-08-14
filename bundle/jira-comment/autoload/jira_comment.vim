function! jira_comment#PostComment(type)
	execute "'[,']w !jira-comment"
endfunction

function! jira_comment#PostOneLineComment(type)
	execute ".w !jira-comment"
endfunction

function! jira_comment#PostPublicComment(type)
	execute "'[,']w !jira-comment --public"
endfunction

function! jira_comment#PostPublicOneLineComment(type)
	execute ".w !jira-comment --public"
endfunction
