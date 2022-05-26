command! -buffer -nargs=1 -complete=file MPchecksums
	\ call macports_checksums#Checksums(<f-args>)
