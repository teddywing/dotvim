" CustomTabLine
"
" A custom tabline that displays tab numbers for easier navigation between tabs.
"
" CHANGELOG:
"   2014.06.30:
"       * Initial version. Very basic. Based on the sample tabline 
"         implementation in vim help. Shows the tab number, filename without 
"         path, modification flag, and separator.
"
" TODO:
" 2014.06.30:
" - Truncate filenames when the number of characters in the tabline exceeds the 
"   width of the window.
" - Improve separator such that it appears between tabs instead of latched onto 
"   the preceeding tab.
"

function! CustomTabLine()
	let s = ''
	for i in range(tabpagenr('$'))
	" select the highlighting
	if i + 1 == tabpagenr()
		let s .= '%#TabLineSel#'
	else
		let s .= '%#TabLine#'
	endif

	" set the tab page number (for mouse clicks)
	let s .= '%' . (i + 1) . 'T'

	" the label is made by CustomTabLabel()
	let s .= ' %{CustomTabLabel(' . (i + 1) . ')}'
	endfor

	" after the last tab fill with TabLineFill and reset tab page nr
	let s .= '%#TabLineFill#%T'

	" right-align the label to close the current tab page
	if tabpagenr('$') > 1
	let s .= '%=%#TabLine#%999XX'
	endif

	return s
endfunction

function! CustomTabLabel(n)
	let buflist = tabpagebuflist(a:n)
	let winnr = tabpagewinnr(a:n)
	let label = ''
	let tab_number = a:n . ': '
	let filename = fnamemodify(bufname(buflist[winnr - 1]), ':p:t')
	
	if filename == ''
		let filename = '[No Name]'
	endif
	
	let label .= tab_number . filename . ' '
	
	if getbufvar(buflist[winnr - 1], "&mod")
	let label .= '[+] '
	endif
	
	let label .= '|'
	
	return label
endfunction

set tabline=%!CustomTabLine()
