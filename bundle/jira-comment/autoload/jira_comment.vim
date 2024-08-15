function! jira_comment#PostComment(type)
	execute "'[,']w !jira-comment"
endfunction

function! jira_comment#PostOneLineComment()
	.w !jira-comment
endfunction

function! jira_comment#PostPublicComment(type)
	execute "'[,']w !jira-comment --public"
endfunction

function! jira_comment#PostPublicOneLineComment()
	.w !jira-comment --public
endfunction


function! jira_comment#ContactComplete()
	let old_completeopt = &completeopt

	let line = getline('.')
	let start = col('.')
	while start > 0 && line[start - 2] =~ '[a-z]'
		let start -= 1
	endwhile

	let base = line[start - 1 : col('.') - 1]
	let contacts = systemlist('aodocs-contacts-search ' . shellescape(base))

	set completeopt=menu,menuone

	call complete(start, contacts)

	let &completeopt = old_completeopt

	return ''
endfunction
