augroup AODocs
	autocmd!

	autocmd BufRead $VIM_PROJECT_PATH_AODOCS_GO/ufo-client/client/*.go
		\ silent GoGuruScope github.com/AODocs-Dev/ufo-client/client

	autocmd BufRead,BufEnter $VIM_PROJECT_PATH_AODOCS_GO/*
		\ call s:UFOCacheSyncClientAddMappings()

	autocmd BufRead $VIM_PROJECT_PATH_AODOCS_GO/ufo-client/*.sh
		\ setlocal expandtab tabstop=4 softtabstop=4 shiftwidth=4

	autocmd BufRead,BufEnter $VIM_PROJECT_PATH_AODOCS/*.{js,ts}
		\ setlocal expandtab tabstop=2 softtabstop=2 shiftwidth=2
			\ formatoptions+=cro

	autocmd BufRead,BufEnter $VIM_PROJECT_PATH_AODOCS/forms-to-aodocs/*.{js,ts}
		\ setlocal expandtab tabstop=4 softtabstop=4 shiftwidth=4
			\ formatoptions+=cro

	autocmd BufRead,BufEnter $VIM_PROJECT_PATH_AODOCS/*.js
		\ call s:ESLintAddMappings()

	autocmd BufRead,BufEnter $VIM_PROJECT_PATH_AODOCS/*.{js,ts}
		\ call s:DebuggerAddMappings()

	autocmd BufRead,BufEnter $VIM_PROJECT_PATH_AODOCS/*.ts
		\ call s:NoUnusedAddMappings()

	" Look up cword in MDN.
	autocmd BufRead,BufEnter $VIM_PROJECT_PATH_AODOCS/*.{js,ts}
		\ nnoremap <buffer> K
			\ :call system('open -a Nightly https://developer.mozilla.org/en-US/docs/Web/API/' . shellescape(expand('<cword>')))<CR>

	autocmd BufRead,BufEnter $VIM_PROJECT_PATH_AODOCS/*.js
		\ iabbrev htodo /**<CR>TODO<CR>/

	autocmd BufRead,BufEnter $VIM_PROJECT_PATH_AODOCS/*.json
		\ setlocal expandtab tabstop=4 softtabstop=4 shiftwidth=4

	autocmd BufRead,BufEnter $VIM_PROJECT_PATH_AODOCS/*.{html,css,scss}
		\ setlocal expandtab tabstop=4 softtabstop=4 shiftwidth=4

	autocmd BufRead,BufEnter $VIM_PROJECT_PATH_AODOCS/*.{dart}
		\ setlocal expandtab tabstop=2 softtabstop=2 shiftwidth=2

	autocmd BufRead,BufEnter $VIM_PROJECT_PATH_AODOCS_MOBILE/*.{dart}
		\ nnoremap <buffer> Zf :!dart format -l 120 %<CR>

	autocmd BufNewFile,BufRead
		\ $VIM_PROJECT_PATH_AODOCS_GO/*/.git/{COMMIT_EDIT,MERGE_,TAG_EDIT}MSG
		\,$VIM_PROJECT_PATH_AODOCS/*/.git/{COMMIT_EDIT,MERGE_,TAG_EDIT}MSG
		\ call s:CommitWackoTextWidthMappings()
		\ | call s:CommitWackoTextWidth()

	" Open Jira ticket ID in the browser
	autocmd BufRead,BufEnter
		\ $VIM_PROJECT_PATH_AODOCS_GO/*
		\,$VIM_PROJECT_PATH_AODOCS/*
		\,$VIM_PROJECT_PATH_AODOCS_ROOT/*
		\ command! JiraOpen :call system('jira-open ' . expand('<cWORD>'))

	" View Jira ticket ID in the shell
	autocmd BufRead,BufEnter
		\ $VIM_PROJECT_PATH_AODOCS_GO/*
		\,$VIM_PROJECT_PATH_AODOCS/*
		\,$VIM_PROJECT_PATH_AODOCS_ROOT/*
		\,*.todo
		\ nnoremap <buffer> <Leader>jv :call <SID>JiraView(expand('<cWORD>'))<CR>

	autocmd BufRead,BufEnter $VIM_PROJECT_PATH_AODOCS_GO/*
		\ let g:go_play_browser_command = 'open -a Nightly %URL% &'
		\| let g:go_addtags_transform = 'camelcase'

	autocmd BufRead,BufEnter $VIM_PROJECT_PATH_AODOCS_UFO_EXTENSION/*.js
		\ setlocal path+=$VIM_PROJECT_PATH_AODOCS_UFO_EXTENSION_MODULE

	autocmd BufRead,BufEnter $VIM_PROJECT_PATH_AODOCS_SMARTBAR/*.js
		\ setlocal path+=extension/module

	autocmd BufRead,BufEnter $VIM_PROJECT_PATH_AODOCS_SMARTBAR_MV3/*.ts
		\ nnoremap <leader>] :call smartbar_mv3_move#Go()<CR>

	" Turn on context.vim
	autocmd BufRead,BufEnter
		\ $VIM_PROJECT_PATH_AODOCS_GO/*
		\,$VIM_PROJECT_PATH_AODOCS/*
		\ ContextEnable

	autocmd BufRead,BufEnter *.todo
		\ nnoremap <buffer> <Leader>yy :call <SID>TodoCopyLast()<CR>

	" Read an email signature
	autocmd FileType mail
		\ nnoremap <buffer> <leader>s :r $XDG_CONFIG_HOME/mutt/signatures/<C-d>
augroup END

" Insert a path to UFO ticket folders
cnoremap <C-x>u <C-r>=$VIM_PROJECT_PATH_AODOCS_UFO_TICKET_FOLDER<CR>


" Write to a temporary file labelled with the current time.
command! -nargs=0 -bang WChat
	\ execute ":write\<bang> " . $VIM_PROJECT_PATH_AODOCS_CHAT_DRAFTS
		\. '/chat-draft-' . strftime('%FT%H.%M.%S') . '.txt'


" Enables a longer-than-72 character first line and 72 character wrapping on
" subsequent lines.
function! s:CommitWackoTextWidth()
	if line('.') == 1
		" Match "CO-123: "
		let matches = matchlist(getline('.'), '^\u\+-\d\+: ')

		if !empty(matches)
			let id_prefix_length = len(matches[0])
			execute 'setlocal textwidth=' . (72 + id_prefix_length)
		endif
	else
		setlocal textwidth=72
	endif
endfunction

function! s:CommitWackoTextWidthMappings()
	inoremap <silent> <buffer> <CR> <C-o>:call <SID>CommitWackoTextWidth()<CR><CR>
	nnoremap <silent> <buffer> o :call <SID>CommitWackoTextWidth()<CR>o
	nnoremap <silent> <buffer> O :call <SID>CommitWackoTextWidth()<CR>O
endfunction


function! s:UFOCacheSyncClientAddMappings()
	nnoremap <buffer> <leader>uc :silent !ufo-cache-syncclient<CR><C-l>
	nnoremap <buffer> <leader>ud :silent !ufo-cache-syncclient rm<CR><C-l>
	nnoremap <buffer> <leader>ur :silent !ufo-cache-syncclient rebuild<CR><C-l>
endfunction


function! s:ESLintAddMappings()
	nnoremap <buffer> <leader>eda :silent !eslint-yes-debugger.sh -a<CR> <Bar> :redraw!<CR>
	nnoremap <buffer> <leader>edd :silent !eslint-yes-debugger.sh -d<CR> <Bar> :redraw!<CR>
endfunction

function! s:DebuggerAddMappings()
	nnoremap <buffer> Zd :
		\ call append(
			\ line('.'),
			\ [
				\ repeat(' ', indent('.')) . '// eslint-disable-next-line no-debugger',
				\ repeat(' ', indent('.')) . 'debugger;'
			\ ]
		\ )
		\ <Bar>
		\ call cursor(line('.') + 2, col('.'))<CR>
	nnoremap <buffer> ZD :
		\ call append(
			\ line('.') - 1,
			\ [
				\ repeat(' ', indent('.')) . '// eslint-disable-next-line no-debugger',
				\ repeat(' ', indent('.')) . 'debugger;'
			\ ]
		\ )
		\ <Bar>
		\ call cursor(line('.') - 1, col('.'))<CR>
endfunction

function! s:NoUnusedAddMappings()
	nnoremap <buffer> Zuv :
		\ call append(
			\ line('.'),
			\ [
				\ repeat(' ', indent('.')) . '// eslint-disable-next-line @typescript-eslint/no-unused-vars',
			\ ]
		\ )
		\ <Bar>
		\ call cursor(line('.') + 2, col('.'))<CR>
	nnoremap <buffer> ZUv :
		\ call append(
			\ line('.') - 1,
			\ [
				\ repeat(' ', indent('.')) . '// eslint-disable-next-line @typescript-eslint/no-unused-vars',
			\ ]
		\ )
		\ <Bar>
		\ call cursor(line('.') - 1, col('.'))<CR>
endfunction


function! s:TodoCopyLast()
	try
		" Copy the last entry to the bottom
		?\n\n\d?,$t$

	" We only have a single entry (pattern not found error).
	catch /^Vim\%((\a\+)\)\?:E486: .*\\n\\n\\d/
		" Add two lines to the end of the file.
		call append('$', ['', ''])

		" Copy the only entry to the bottom.
		0,$-2t$

	finally
		" Move to date line
		?\n\n\zs\d?

		" Increment day, then put the current entry at the top of the window
		call setline('.', strftime('%Y.%m.%d:'))
		execute "normal! zt2\<C-e>"
	endtry
endfunction


function! s:JiraView(cword)
	let ticket_id = matchstr(a:cword, "\\v([A-Z]+-[0-9]+)")
	execute '!jira view ' . ticket_id
endfunction
