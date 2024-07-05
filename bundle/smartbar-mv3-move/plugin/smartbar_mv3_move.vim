if exists('g:loaded_smartbar_mv3_move')
	finish
endif
let g:loaded_smartbar_mv3_move = 1

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

function! s:MessageMatches(cword)
	let search_command = 'rg --fixed-strings --line-number --column '
		\ . a:cword
		\ . ' src/content-script src/service-worker'

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

function! s:MessageGo()
	let cword = s:MessageCword()
	let matches = s:MessageMatches(cword)

	" TODO: Exclude the current line
	let matches = s:ExcludeCurrentLine(matches)

	echom matches
endfunction

" TODO: Parse output:

" src/content-script/utils/location.utils.ts:9:23:    type: MessageType.LOCATION_CHANGED_TRIGGER,
" src/content-script/utils/location.utils.ts:16:27:        type: MessageType.LOCATION_CHANGED_TRIGGER,
" src/service-worker/location/location.listener.ts:10:17:    MessageType.LOCATION_CHANGED_TRIGGER,
" src/service-worker/serviceWorker.ts:129:28:          case MessageType.LOCATION_CHANGED_TRIGGER:

" TODO: Go to content script from service worker and vice versa


nnoremap <leader>] :call <SID>MessageGo()<CR>
