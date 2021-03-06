" Constructs a GitHub URL for the current Git repo by making substitutions to
" the SSH location to turn it into an HTTP URL.
function! s:BaseRepoURL()
	let remote = system('git remote get-url origin')
	let base_url = substitute(remote, ':', '/', '')
	let base_url = substitute(base_url, '^git@', 'https://', '')
	let base_url = substitute(base_url, '.git\n$', '', '')

	return base_url
endfunction

" Constructs a GitHub URL to the current file using the current HEAD's SHA. If
" lines are passed in, these are included in the URL. The `include_lines`
" argument comes from a `:command`'s `<count>`, and tells the function whether
" a range was given.
function! s:FileURL(include_lines, start_line, end_line)
	let current_sha = system('git show --no-patch --format="format:%H"')
	let current_sha = substitute(current_sha, '\n$', '', '')
	let current_filename = s:FilePathRelativeToRepoRoot()
	let lines = ''

	if a:include_lines
		let lines = '#L' . a:start_line

		if a:start_line != a:end_line
			let lines = lines . '-L' . a:end_line
		endif
	endif

	return s:BaseRepoURL() . '/blob/' . current_sha . current_filename . lines
endfunction

" Copy the GitHub URL to the clipboard and echo it to the command line.
function! github_url#GitHubURL(include_lines, start_line, end_line)
	let url = s:FileURL(a:include_lines, a:start_line, a:end_line)

	call system('pbcopy', url)
	echo url
endfunction

" Get the path of the current file relative to the repository root. Gives us
" the correct path to the file even if `:pwd` is below the Git root. The
" returned path begins with a `/`.
function! s:FilePathRelativeToRepoRoot()
	let repo_root = system('git rev-parse --show-toplevel')[:-2]
	let current_file_absolute = expand('%:p')

	return substitute(current_file_absolute, repo_root, '', '')
endfunction
