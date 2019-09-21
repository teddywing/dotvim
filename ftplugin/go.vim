" Go vim settings

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


nmap <buffer> Zr :GoRun .<CR>
nmap <buffer> Zb <Plug>(go-build)
nmap <buffer> Zc <Plug>(go-test-compile)
nmap <buffer> Zf <Plug>(go-imports)
nmap <buffer> <leader>z <Plug>(go-test)
nmap <buffer> <leader>Z <Plug>(go-test-func)
