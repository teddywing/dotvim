" Flashnotes
augroup Flashnotes
	autocmd!
	autocmd BufRead,BufEnter $VIM_PROJECT_PATH_FLASHNOTES/*.{scss,js,html} setlocal expandtab tabstop=2 softtabstop=2 shiftwidth=2 textwidth=100
	
	" Generate a new ctags file for Python sources. Use tmux to run the command in the background.
	autocmd BufRead,BufEnter $VIM_PROJECT_PATH_FLASHNOTES/*.{py}
		\ nnoremap <buffer> <leader>gc :silent! execute '!tmux new -d "ctags --languages=Python --python-kinds=-i --excmd=number -f $VIM_PROJECT_PATH_FLASHNOTES_ROOT/tags -R $VIM_PROJECT_PATH_FLASHNOTES/ $VIM_PROJECT_PATH_VIRTUALENVS"' \| redraw!<cr> |
		\ setlocal tags+=tags; " Look for tags file and recurse up directories
	
	" Generage a new ctags file for JavaScript sources
	autocmd BufRead,BufEnter $VIM_PROJECT_PATH_FLASHNOTES/*.{js}
		\ nnoremap <buffer> <leader>gc :silent! execute '!tmux new -d "ctags --options=$VIM_PROJECT_PATH_FLASHNOTES_ROOT/.ctags.conf --languages=js --excmd=number -f $VIM_PROJECT_PATH_FLASHNOTES_ROOT/jstags -R $VIM_PROJECT_PATH_FLASHNOTES/flashnotes/static/js"' \| redraw!<cr> |
		\ setlocal tags+=jstags;
augroup END
