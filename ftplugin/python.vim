" Python vim settings

" Indentation
setlocal expandtab
setlocal tabstop=4
setlocal softtabstop=4
setlocal shiftwidth=4


setlocal textwidth=79


" Don't preserve indentation on empty lines
inoremap <buffer> <CR> <CR>
nnoremap <buffer> o o
nnoremap <buffer> O O


" Quickly add a debug line
nnoremap <buffer> <leader>gdo oimport ipdb; ipdb.set_trace()<Esc>_
nnoremap <buffer> <leader>gdO Oimport ipdb; ipdb.set_trace()<Esc>_


" Flake8 validation
nnoremap <buffer> <leader>gs :!flake8 %<cr>
