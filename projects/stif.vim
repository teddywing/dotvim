augroup stif
	autocmd!

	autocmd BufRead,BufEnter $VIM_PROJECT_PATH_STIF/*
		\ let g:rspec_command = "!bundle exec spring rspec {spec}"
augroup END
