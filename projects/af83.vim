" af83
augroup af83
	autocmd!

	autocmd BufRead,BufEnter $VIM_PROJECT_PATH_AF83/*
		\ nnoremap <buffer> <leader>mk :mksession! vimsession<cr>
augroup END
