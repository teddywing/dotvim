vim9script

if exists('g:loaded_insert_layout')
	finish
endif
g:loaded_insert_layout = 1


# insert-layout
# Set a different keyboard layout to use in insert mode. Allows a familiar
# layout to be used in narmal and other modes while being able to write in a
# different layout at the same time.

import autoload '../autoload/insert_layout.vim'

command! -nargs=1 -complete=custom,insert_layout.Complete
	\ InsertLayout
	\ insert_layout.InsertLayoutOn(<q-args>)
command! InsertLayoutOff insert_layout.InsertLayoutOff()
