function! write_with_spaces#Write(bang, filename)
	execute "w".a:bang." ". substitute(a:filename, ' ', '\\ ', 'g')
endfunction
