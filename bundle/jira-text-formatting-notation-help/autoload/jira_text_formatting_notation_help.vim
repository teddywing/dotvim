let s:script_path = resolve(expand('<sfile>:p:h'))


function! jira_text_formatting_notation_help#Open()
	execute 'botright vsplit ' .
		\ s:script_path .
		\ '/Jira Text Formatting Notation Help.txt'
	setlocal nomodified nomodifiable noswapfile readonly
	setlocal nolist
	setlocal nobuflisted buftype=nofile bufhidden=wipe
	wincmd p
endfunction
