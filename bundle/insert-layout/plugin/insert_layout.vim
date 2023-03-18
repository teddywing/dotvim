" 2023.03.09

augroup frinsert
	autocmd!
	autocmd InsertEnter * :call system('xkbswitch -se French-numerical')
	autocmd InsertLeave * :call system('xkbswitch -se US')
augroup END
