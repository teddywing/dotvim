" af83
augroup af83
	autocmd!

	autocmd BufRead,BufEnter $VIM_PROJECT_PATH_AF83/*
		\ let g:pick_command = "ag -l -a -p './.agignore' -g ''"

	autocmd BufRead,BufEnter $VIM_PROJECT_PATH_AF83/*
		\ let g:rspec_command = "!bundle exec spring rspec {spec}"

	autocmd BufRead,BufEnter $VIM_PROJECT_PATH_AF83/**/.git/{COMMIT_EDIT,TAG_EDIT,MERGE_,}MSG
		\ inoreabbrev <buffer> Ouibus the socle commun
		\| inoreabbrev <buffer> OuiBus the socle commun
		\| inoreabbrev <buffer> ouibus the socle commun
augroup END
