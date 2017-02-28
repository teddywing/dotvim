" CoffeeScript vim settings

" Indentation
setlocal expandtab
setlocal tabstop=2
setlocal softtabstop=2
setlocal shiftwidth=2


" Don't preserve indentation on empty lines
inoremap <buffer> <CR> <CR>
nnoremap <buffer> o o
nnoremap <buffer> O O


" Comment string
setlocal commentstring=#\ %s
