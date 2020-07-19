" Rust vim settings

if exists('b:did_ftplugin')
	unlet b:did_ftplugin
endif


" Indentation
setlocal expandtab
setlocal tabstop=4
setlocal softtabstop=4
setlocal shiftwidth=4


" Comment string
setlocal commentstring=//\ %s


" Add a trailing comma when expanding elements to multiple lines
let b:argwrap_tail_comma = 1


nnoremap <buffer>Zr :!cargo run<CR>
nnoremap <buffer>Zb :!cargo build<CR>
