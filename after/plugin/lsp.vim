if !has('patch-8.1.1876')
	finish
endif

call LspOptionsSet(#{
	\ autoComplete: v:false,
	\ showDiagInPopup: v:false,
	\ showDiagOnStatusLine: v:true,
	\ showSignature: v:false,
	\ hoverInPreview: v:true,
	\ completionMatcher: 'icase',
	\ completionTextEdit: v:false,
	\ snippetSupport: v:true,
	\ vsnipSupport: v:true
\ })


" Dart language server.
call LspAddServer([#{
	\ name: 'dartls',
	\ filetype: ['dart'],
	\ path: 'dart',
	\ args: ['language-server', '--protocol=lsp', '--client-id=vim'],
	\ initializationOptions: #{
		\ suggestFromUnimportedLibraries: v:true
	\ },
	\ workspaceConfig: #{
		\ dart: #{
			\ completeFunctionCalls: v:true,
			\ enableSnippets: v:true
		\ }
	\ }
\ }])
