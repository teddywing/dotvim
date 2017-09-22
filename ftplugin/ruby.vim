" Ruby vim settings

" Indentation
setlocal expandtab
setlocal tabstop=2
setlocal softtabstop=2
setlocal shiftwidth=2


" Don't preserve indentation on empty lines
inoremap <buffer> <CR> <CR>
nnoremap <buffer> o o
nnoremap <buffer> O O


" Debugging
nnoremap <buffer> Zd obyebug<Esc>
nnoremap <buffer> ZD Obyebug<Esc>


" Spring
command! -buffer FuckSpring :!bundle exec spring stop
