" Better autoread
" Better detection for when files have changed outside of vim. Will 
" automatically reload files if they changed. If you've made modifications to 
" the file, you'll be prompted before the file is loaded.
"
" Taken from Greg Sexton:
" http://stackoverflow.com/a/10962191

set autoread
augroup checktime
	autocmd!
	if !has("gui_running")
		"silent! necessary otherwise throws errors when using command
		"line window.
		autocmd BufEnter        * silent! checktime
		autocmd CursorHold      * silent! checktime
		autocmd CursorHoldI     * silent! checktime
		"these two _may_ slow things down. Remove if they do.
		" autocmd CursorMoved     * silent! checktime
		" autocmd CursorMovedI    * silent! checktime
	endif
augroup END
