if exists('g:loaded_text_simple_version')
	finish
endif
let g:loaded_text_simple_version = 1

nnoremap <silent> <Plug>TextSimpleVersion :call text_simple_version#NewVersion()<CR>
