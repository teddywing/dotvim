" Comment string
call tcomment#DefineType('objc', '// %s')


" Swap .h and .m alternates
nnoremap <buffer> <C-^> :FSHere<CR>


" Hack to fix up errors from Match-Bracket-for-Objective-C on multiline
" message calls.
nmap <buffer> d] ds]f<Space>r]
