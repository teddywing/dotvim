" Check if the current buffer is in the service worker or content script
" web extension context.
function! s:ExtensionContext()
	let file_name = bufname()
	if match(file_name, 'service-worker') != -1
		return 'service-worker'
	elseif match(file_name, 'content-script') != -1
		return 'content-script'
	else
		throw "Unrecognised extension context: '" . file_name . "'"
	endif
endfunction

" Get cword with 'iskeyword' customisations.
function! s:MessageCword()
	" Include "." in &iskeyword to get "MessageType.A_MESSAGE_TYPE" when the
	" cursor is on the first "M" in "type: MessageType.A_MESSAGE_TYPE,".
	"
	" This allows searching without having the cursor within "A_MESSAGE_TYPE".
	let isk_save = &iskeyword
	set iskeyword+=.
	let cword = expand('<cword>')
	let &iskeyword = isk_save

	return cword
endfunction

" Get a list of locations in the project that match cword.
function! s:MessageMatches(cword, extension_context)
	let dir_filter = ''
	if a:extension_context == 'service-worker'
		let dir_filter = ' src/content-script'
	elseif a:extension_context == 'content-script'
		let dir_filter = ' src/service-worker'
	endif

	let search_command = 'rg --fixed-strings --word-regexp --line-number --column '
		\ . a:cword
		\ . dir_filter

	let results = systemlist(search_command)

	return results
endfunction

" Exclude the current line from the list of matches.
function! s:ExcludeCurrentLine(matches)
	let file_name = bufname()
	let current_line = line('.')

	let exclude_match = file_name . ':' . current_line

	call filter(a:matches, 'match(v:val, "' . exclude_match . '")')

	return a:matches
endfunction

" Prompt user to choose from a list of matches.
function! s:PromptMatch(matches, tagname)
	echohl Title
	echo '  # tag'
	echon repeat(' ', len(a:tagname) - 2)
	echon 'file'
	echohl None

	let i = 1
	for match in a:matches
		let match_parts = split(match, ':')
		let file_name = match_parts[0]
		let line_content = join(match_parts[3:], '')

		echon "\n  " . i . ' '
		echohl Title
		echon a:tagname . ' '
		echohl Directory
		echon file_name
		echohl None
		echo '   ' . line_content

		let i += 1
	endfor

	call inputsave()
	let choice = input('Type number and <Enter> (empty cancels): ')
	call inputrestore()
	return choice
endfunction

" Go to the given match and add the prior location to the tag stack.
function! s:GoToMatch(match, tagname)
	" Save current position for tag stack.
	let current_window = winnr()
	let pos = [bufnr()] + getcurpos()[1:]

	" Get position from `match`.
	let parts = split(a:match, ':')
	let file = parts[0]
	let line = parts[1]
	let column = parts[2]

	execute 'edit ' . file
	call cursor(line, column)

	" Append to tag stack
	let tag = [{'from': pos, 'tagname': a:tagname}]
	call settagstack(current_window, {'items': tag}, 'a')
endfunction

" Get matches in the project for the message under the cursor, and go to that
" message.
function! smartbar_mv3_move#MessageGo()
	let extension_context = s:ExtensionContext()
	let cword = s:MessageCword()
	let matches = s:MessageMatches(cword, extension_context)

	let matches = s:ExcludeCurrentLine(matches)

	" Default to first match.
	let choice = 0

	if len(matches) > 1
		let choice = s:PromptMatch(matches, cword)

		" Exit prompt if match is not a number.
		if match(choice, '[0-9]\+') == -1
			return
		endif

		" Convert to array index.
		let choice -= 1
	endif

	call s:GoToMatch(matches[choice], cword)
endfunction
