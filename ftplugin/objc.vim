" Indentation
setlocal expandtab
setlocal tabstop=4
setlocal softtabstop=4
setlocal shiftwidth=4


" Comment string
call tcomment#DefineType('objc', '// %s')


" Swap .h and .m alternates
nnoremap <buffer> <C-^> :FSHere<CR>
