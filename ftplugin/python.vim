" Python vim settings

" Indentation
setlocal expandtab
setlocal tabstop=4
setlocal softtabstop=4
setlocal shiftwidth=4


setlocal textwidth=79


" Quickly add a debug line
nnoremap <buffer> <leader>gdo oimport ipdb; ipdb.set_trace()<Esc>_
nnoremap <buffer> <leader>gdO Oimport ipdb; ipdb.set_trace()<Esc>_


" Flake8 validation
nnoremap <buffer> <leader>gs :!flake8 %<cr>


" Add a trailing comma when expanding elements to multiple lines
let b:argwrap_tail_comma = 1
