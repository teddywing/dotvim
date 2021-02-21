" Common Lisp vim settings

if exists('b:did_ftplugin')
	unlet b:did_ftplugin
endif


" Indentation
setlocal expandtab
setlocal tabstop=2
setlocal softtabstop=2
setlocal shiftwidth=2


" Use <Space> as LocalLeader
let maplocalleader = "\<Space>"
