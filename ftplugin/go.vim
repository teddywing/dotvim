" Go vim settings

compiler go


" Compile package
nnoremap <buffer> <leader>cc :make<cr>

" Compile file
nnoremap <buffer> <leader>cf :make %<cr>

" Compile & run file
nnoremap <buffer> <leader>cr :!go run %<cr>

" Format
nnoremap <buffer> cdf :!go fmt %<cr>


" Comment string
setlocal commentstring=//\ %s
