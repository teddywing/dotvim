vim9script

if exists('g:loaded_insert_layout')
	finish
endif
g:loaded_insert_layout = 1

const layout_names = {
	us: 'US',
	qwazerty: 'QWAZERTY2',
	fr: 'French-numerical',
	dvorak: 'Dvorak',
}

var normal_layout: string

def IsLayoutSwitcherAvailable(): number
	return executable('xkbswitch')
enddef

def CurrentInputLayout(): string
	return system('xkbswitch -ge')
enddef

def SetInputLayout(layout: string): void
	system('xkbswitch -se ' .. layout)
enddef

def OnInsertEnter(layout: string): void
	normal_layout = CurrentInputLayout()

	SetInputLayout(layout)
enddef

def OnInsertLeave(): void
	SetInputLayout(normal_layout)
enddef

def InsertLayoutOff(): void
	# autocmd! insert_layout InsertEnter <buffer>
	# autocmd! insert_layout InsertLeave <buffer>

	autocmd_delete([
		{
			group: 'insert_layout',
			event: 'InsertEnter',
			bufnr: bufnr(),
		},
		{
			group: 'insert_layout',
			event: 'InsertLeave',
			bufnr: bufnr(),
		},
	])
enddef

def InsertLayoutOn(layout: string): void
	if !IsLayoutSwitcherAvailable()
		echoerr "'xkbswitch' command not found"
		return
	endif

	# autocmd insert_layout InsertEnter <buffer> OnInsertEnter(layout)
	# autocmd insert_layout InsertLeave <buffer> OnInsertLeave()
	autocmd_add([
		{
			replace: true,
			group: 'insert_layout',
			event: 'InsertEnter',
			bufnr: bufnr(),
			cmd: 'OnInsertEnter("' .. layout_names[layout] .. '")',
		},
		{
			replace: true,
			group: 'insert_layout',
			event: 'InsertLeave',
			bufnr: bufnr(),
			cmd: 'OnInsertLeave()',
		},
	])
enddef

def Complete(arg_lead: string, cmd_line: string, cursor_pos: number): string
	return join(keys(layout_names), "\n")
enddef

command! -nargs=1 -complete=custom,Complete InsertLayout InsertLayoutOn(<q-args>)
command! InsertLayoutOff InsertLayoutOff()

# SetInputLayout(layout_names['fr'])

# augroup frinsert
# 	autocmd!
# 	autocmd InsertEnter * :call system('xkbswitch -se French-numerical')
# 	autocmd InsertLeave * :call system('xkbswitch -se US')
# augroup END
