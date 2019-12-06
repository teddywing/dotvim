if exists('g:no_plugin_maps') || exists('g:no_git_shortcut_maps')
	finish
endif

let b:undo_ftplugin = ''

if !hasmapto('<Plug>GitShortcutsCommitBackward')
	nmap <buffer> [[ <Plug>GitShortcutsCommitBackward
	omap <buffer> [[ <Plug>GitShortcutsCommitBackward

	let b:undo_ftplugin .= '| nunmap <buffer> [['
	let b:undo_ftplugin .= '| ounmap <buffer> [['
endif

if !hasmapto('<Plug>GitShortcutsCommitForward')
	nmap <buffer> ]] <Plug>GitShortcutsCommitForward
	omap <buffer> ]] <Plug>GitShortcutsCommitForward

	let b:undo_ftplugin .= '| nunmap <buffer> ]]'
	let b:undo_ftplugin .= '| ounmap <buffer> ]]'
endif

nnoremap <silent> <buffer> <Plug>GitShortcutsCommitBackward :call git_shortcuts#CommitBackward()<CR>
nnoremap <silent> <buffer> <Plug>GitShortcutsCommitForward :call git_shortcuts#CommitForward()<CR>

onoremap <silent> <buffer> <Plug>GitShortcutsCommitBackward :call git_shortcuts#CommitBackward()<CR>
onoremap <silent> <buffer> <Plug>GitShortcutsCommitForward :call git_shortcuts#CommitForward()<CR>
