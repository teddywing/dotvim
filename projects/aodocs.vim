augroup AODocs
	autocmd!

	autocmd BufRead $VIM_PROJECT_PATH_AODOCS_GO/ufo-client/client/*.go
		\ silent GoGuruScope github.com/Revevol-Apps/ufo-client/client

	autocmd BufRead,BufEnter $VIM_PROJECT_PATH_AODOCS_GO/*
		\ call s:UFOCacheSyncClientAddMappings()

	autocmd BufRead $VIM_PROJECT_PATH_AODOCS_GO/ufo-client/*.sh
		\ setlocal expandtab tabstop=4 softtabstop=4 shiftwidth=4

	autocmd BufRead,BufEnter $VIM_PROJECT_PATH_AODOCS/*.js
		\ setlocal expandtab tabstop=2 softtabstop=2 shiftwidth=2
			\ formatoptions+=cro

	autocmd BufRead,BufEnter $VIM_PROJECT_PATH_AODOCS/*.js
		\ call s:ESLintAddMappings()

	autocmd BufRead,BufEnter $VIM_PROJECT_PATH_AODOCS/*.json
		\ setlocal expandtab tabstop=4 softtabstop=4 shiftwidth=4

	autocmd BufRead,BufEnter $VIM_PROJECT_PATH_AODOCS/*.{html,css}
		\ setlocal expandtab tabstop=4 softtabstop=4 shiftwidth=4

	autocmd BufNewFile,BufRead
		\ $VIM_PROJECT_PATH_AODOCS_GO/*/.git/{COMMIT_EDIT,MERGE_,TAG_EDIT}MSG
		\,$VIM_PROJECT_PATH_AODOCS/*/.git/{COMMIT_EDIT,MERGE_,TAG_EDIT}MSG
		\ call s:CommitWackoTextWidthMappings()
		\ | call s:CommitWackoTextWidth()
augroup END


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
