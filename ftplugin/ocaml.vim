" OCaml vim settings

" Indentation
setlocal expandtab
setlocal tabstop=2
setlocal softtabstop=2
setlocal shiftwidth=2


nnoremap <buffer> Zr
	\ :execute '!eval $(opam env) && dune exec ' . fnameescape(expand('%:p:h:h:t'))<CR>
nnoremap <buffer> Zb :!eval $(opam env) && dune build<CR>
nnoremap <buffer> <leader>z :!eval $(opam env) && dune test<CR>
