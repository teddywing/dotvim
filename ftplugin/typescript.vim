" TypeScript vim settings

setlocal commentstring=//\ %s

setlocal suffixesadd+=.ts

let b:undo_ftplugin = ''


nnoremap <silent> <buffer> gf
	\ :<C-u>call <SID>FindFile(v:count1, expand('<cfile>'), 'find', 'gf')<CR>
nnoremap <buffer> <C-w>f
	\ :<C-u>call <SID>FindFile(v:count1, expand('<cfile>'), 'sfind', '<C-v><C-w>f')<CR>
nnoremap <silent> <buffer> <C-w><C-f>
	\ :<C-u>call <SID>FindFile(v:count1, expand('<cfile>'), 'sfind', '<C-v><C-w><C-v><C-f>')<CR>
nnoremap <silent> <buffer> <C-w>gf
	\ :<C-u>call <SID>FindFile(v:count1, expand('<cfile>'), 'tabfind', '<C-v><C-w>gf')<CR>

" Debugging
nnoremap <buffer> Zd odebugger;<Esc>
nnoremap <buffer> ZD Odebugger;<Esc>

nnoremap <buffer> Zc :make<CR>

nnoremap <buffer> Zf
	\ :<C-u>execute 'silent !prettier --write ' . shellescape(expand('%'))
	\ <Bar> redraw!<CR>

let b:undo_ftplugin .= 'nunmap <buffer> gf'
let b:undo_ftplugin .= '| nunmap <buffer> <C-w>f'
let b:undo_ftplugin .= '| nunmap <buffer> <C-w><C-f>'
let b:undo_ftplugin .= '| nunmap <buffer> <C-w>gf'
let b:undo_ftplugin .= '| nunmap <buffer> Zd'
let b:undo_ftplugin .= '| nunmap <buffer> ZD'
let b:undo_ftplugin .= '| nunmap <buffer> Zc'
let b:undo_ftplugin .= '| nunmap <buffer> Zf'


if exists('*s:FindFile')
	finish
endif

" If `fname` is a directory, open fname/index.ts using `command`. Otherwise,
" run `map` with `count`.
function! s:FindFile(count, fname, command, map)
	let relative_file = expand('%:h') . '/' . a:fname

	if isdirectory(relative_file)
		execute a:command . ' ' . relative_file . '/index.ts'

		return
	endif

	execute 'normal! ' . a:count . a:map
endfunction
