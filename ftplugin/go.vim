" Go vim settings

if exists('b:did_ftplugin')
	unlet b:did_ftplugin
endif


compiler go


" Compile package
nnoremap <buffer> <leader>cc :make<cr>

" Compile file
nnoremap <buffer> <leader>cd :make %<cr>

" Compile & run file
nnoremap <buffer> <leader>cr :!go run %<cr>

" Format
nnoremap <buffer> cdf :!go fmt %<cr>


" Comment string
setlocal commentstring=//\ %s


" Continue comments on <Enter> and `o` `O`.
setlocal formatoptions+=or


" Add a trailing comma when expanding elements to multiple lines
let b:argwrap_tail_comma = 1


nmap <buffer> Zr :GoRun .<CR>
nmap <buffer> Zb <Plug>(go-build)
nmap <buffer> Zc <Plug>(go-test-compile)
nmap <buffer> Zf <Plug>(go-imports)
nmap <buffer> <leader>z <Plug>(go-test)
nmap <buffer> <leader>Z <Plug>(go-test-func)
nnoremap <buffer> Zs :execute '!go test -v ' . fnameescape(expand('%:p:h'))<CR>
nmap <buffer> z<C-^> :call go#alternate#Switch(1, 'edit')<CR>
nmap <buffer> <C-w>z<C-^> :call go#alternate#Switch(1, 'vsplit')<CR>

nmap <buffer> Ze <Plug>(go-iferr)


command! -buffer -nargs=? GoDoc call s:GoDoc(<q-args>)


if exists('*s:GoDoc')
	finish
endif

function! s:GoDoc(search_term)
	let search_term = a:search_term
	if search_term == ''
		let search_term = expand('<cword>')
	endif

	new
	\| execute 'read !go doc -all ' . shellescape(search_term)
	\| set readonly nomodified
	\| setfiletype go
endfunction
