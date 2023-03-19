vim9script

if exists('g:loaded_insert_layout')
	finish
endif
g:loaded_insert_layout = 1


import autoload '../autoload/insert_layout.vim'

command! -nargs=1 -complete=custom,insert_layout.Complete
	\ InsertLayout
	\ insert_layout.InsertLayoutOn(<q-args>)
command! InsertLayoutOff insert_layout.InsertLayoutOff()
