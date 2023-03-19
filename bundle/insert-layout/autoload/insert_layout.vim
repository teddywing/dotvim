vim9script

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

export def InsertLayoutOff(): void
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

export def InsertLayoutOn(layout: string): void
	if !IsLayoutSwitcherAvailable()
		echoerr "'xkbswitch' command not found"
		return
	endif

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

export def Complete(arg_lead: string, cmd_line: string, cursor_pos: number): string
	return join(keys(layout_names), "\n")
enddef
