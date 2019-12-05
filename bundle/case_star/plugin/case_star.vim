" TODO: if not on start of word, ensure we move to previous match
nnoremap <silent> c# ?\C<C-r>=expand('<cword>')<CR><CR>
nnoremap <silent> c* /\C<C-r>=expand('<cword>')<CR><CR>

" TODO: Currently behaves like g* g#. Need * # versions.
