" TODO: if not on start of word, ensure we move to previous match
" nnoremap <silent> c# :call search('\C' . expand('<cword>'), 'bz')<CR>
" nnoremap <expr> c# <SID>SearchBackward()
" nnoremap c# :call <SID>SearchBackward()<CR>
nnoremap <expr> c# <SID>SearchBackward()
" nnoremap <silent> c* :call search('\C' . expand('<cword>'), 'z')<CR>
nnoremap <silent> c* /\C<C-r>=expand('<cword>')<CR><CR>

" call search('\C' . expand('<cword>'), 'bz')
" call search('\C' . expand('<cword>'), 'z')

" TODO: Currently behaves like g* g#. Need * # versions.


" function! s:SearchBackward()
" 	call search('\<', 'bc')
" 	" return "?\\C\<C-r>=expand('<cword>')\<CR>\<CR>"
" 	" execute 'normal! ?\C' . expand('<cword>') . '<CR>'
" 	execute 'normal! ?\C' . expand('<cword>') . "\<CR>"
" endfunction

function! s:SearchBackward()
	let expr = ''

	let expr .= ":call search('\<', 'bc')\<CR>"
	" let expr .= "?\\C\<C-r>=expand('<cword>')\<CR>\<CR>"
	let cword = expand('<cword>')
	let expr .= '?\C' . cword ."\<CR>"

	return expr
endfunction
