" Indentation
setlocal expandtab
setlocal tabstop=4
setlocal softtabstop=4
setlocal shiftwidth=4


" Don't preserve indentation on empty lines
inoremap <buffer> <CR> <CR>
nnoremap <buffer> o o
nnoremap <buffer> O O


" Comment string
call tcomment#DefineType('objc', '// %s')
