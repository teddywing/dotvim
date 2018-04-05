" TODO: doc
function! s:BaseRepoURL()
	let remote = system('git remote get-url origin')
	let base_url = substitute(remote, ':', '/', '')
	let base_url = substitute(base_url, '^git@', 'https://', '')
	let base_url = substitute(base_url, '.git\n$', '', '')

	return base_url
endfunction

" TODO: doc
function! s:FileURL(include_lines, start_line, end_line)
	let current_sha = system('git show --format="format:%H"')
	let current_sha = substitute(current_sha, '\n$', '', '')
	let current_filename = expand('%')
	let lines = ''

	if a:include_lines
		let lines = '#L' . a:start_line . '-L' . a:end_line
	endif

	return s:BaseRepoURL() . '/blob/' . current_sha . '/' . current_filename . lines
endfunction

" echo s:FileURL()
command! -range=0 GitHubFileURL :echo <SID>FileURL(<count>, <line1>, <line2>)
