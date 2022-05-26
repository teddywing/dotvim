command! -buffer -nargs=1 -complete=file MPchecksums
	\ call macports_checksums#Checksums(<f-args>)

if !exists('b:undo_ftplugin')
	let b:undo_ftplugin = ''
endif

let b:undo_ftplugin .= '| delcommand MPchecksums'
