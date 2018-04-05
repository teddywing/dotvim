if exists('g:loaded_github_url')
	finish
endif
let g:loaded_github_url = 1

command! -range=0 GitHubFileURL :call github_url#GitHubURL(<count>, <line1>, <line2>)
