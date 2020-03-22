let s:COMMIT_START_PATTERN = '^commit'


function! git_shortcuts#CommitBackward()
	call search(s:COMMIT_START_PATTERN, 'bz')
endfunction

function! git_shortcuts#CommitForward()
	call search(s:COMMIT_START_PATTERN)
endfunction
