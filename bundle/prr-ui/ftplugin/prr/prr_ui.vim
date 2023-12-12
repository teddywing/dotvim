let b:undo_ftplugin = ''

" Educate quotes.
if !exists('b:textobj_quote_educate_mapped')
\ || b:textobj_quote_educate_mapped == 0
	Educate
	let b:undo_ftplugin .= '| NoEducate'
endif
