" Dart language server.
call LspAddServer([#{
	\ name: 'dartls',
	\ filetype: ['dart'],
	\ path: 'dart',
	\ args: ['language-server', '--protocol=lsp', '--client-id=vim']
\ }])
