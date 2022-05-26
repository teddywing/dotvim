" Append MacPorts checksums for `a:file` to the current line.
function! macports_checksums#Checksums(file)
	let rmd160 = system('openssl dgst -rmd160 ' . fnameescape(a:file))[:-2]
	let sha256 = system('shasum -a 256 ' . fnameescape(a:file))
	let filesize = system('wc -c ' . fnameescape(a:file))

	call append(
		\ '.',
		\ '                    size    ' . split(filesize, ' ')[0]
	\ )
	call append(
		\ '.',
		\ '                    sha256  ' . split(sha256, ' ')[0] . ' \'
	\ )
	call append(
		\ '.',
		\ 'checksums           rmd160  ' . split(rmd160, ' ')[1] . ' \'
	\ )
endfunction
