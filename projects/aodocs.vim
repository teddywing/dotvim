augroup AODocs
	autocmd!

	autocmd BufRead $VIM_PROJECT_PATH_AODOCS_GO/ufo-client/client/*.go
		\ silent GoGuruScope github.com/Revevol-Apps/ufo-client/client

	autocmd BufRead,BufEnter $VIM_PROJECT_PATH_AODOCS/*.js
		\ setlocal expandtab tabstop=2 softtabstop=2 shiftwidth=2

	autocmd BufRead,BufEnter $VIM_PROJECT_PATH_AODOCS/*.json
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
		setlocal textwidth=80
	else
		setlocal textwidth=72
	endif
endfunction

function! s:CommitWackoTextWidthMappings()
	inoremap <buffer> <CR> <C-o>:call <SID>CommitWackoTextWidth()<CR><CR>
	nnoremap <buffer> o :call <SID>CommitWackoTextWidth()<CR>o
	nnoremap <buffer> O :call <SID>CommitWackoTextWidth()<CR>O
endfunction
