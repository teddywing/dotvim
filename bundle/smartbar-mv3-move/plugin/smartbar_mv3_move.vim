if exists('g:loaded_smartbar_mv3_move')
	finish
endif
let g:loaded_smartbar_mv3_move = 1

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

function! s:MessageMatches(cword, extension_context)
	let dir_filter = ''
	if a:extension_context == 'service-worker'
		let dir_filter = ' src/content-script'
	elseif a:extension_context == 'content-script'
		let dir_filter = ' src/service-worker'
	endif

	let search_command = 'rg --fixed-strings --line-number --column '
		\ . a:cword
		\ . dir_filter

	let results = systemlist(search_command)

	return results
endfunction

function! s:ExcludeCurrentLine(matches)
	let file_name = bufname()
	let current_line = line('.')

	let exclude_match = file_name . ':' . current_line

	call filter(a:matches, 'match(v:val, "' . exclude_match . '")')

	return a:matches
endfunction

function! s:PromptMatch(matches, tagname)
	" TODO: Make a prompt that looks like the g] tag prompt.
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
	let choice = input('Type number and <Enter> (q or empty cancels): ')
	call inputrestore()
	return choice
endfunction

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

function! s:MessageGo()
	let extension_context = s:ExtensionContext()
	let cword = s:MessageCword()
	let matches = s:MessageMatches(cword, extension_context)

	" TODO: Exclude the current line
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

	" let first_match = matches[0]
	call s:GoToMatch(matches[choice], cword)
endfunction

" TODO: Parse output:

" src/content-script/utils/location.utils.ts:9:23:    type: MessageType.LOCATION_CHANGED_TRIGGER,
" src/content-script/utils/location.utils.ts:16:27:        type: MessageType.LOCATION_CHANGED_TRIGGER,
" src/service-worker/location/location.listener.ts:10:17:    MessageType.LOCATION_CHANGED_TRIGGER,
" src/service-worker/serviceWorker.ts:129:28:          case MessageType.LOCATION_CHANGED_TRIGGER:

" TODO: Go to content script from service worker and vice versa


nnoremap <leader>] :call <SID>MessageGo()<CR>
