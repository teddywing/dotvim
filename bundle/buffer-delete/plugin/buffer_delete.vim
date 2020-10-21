if exists('g:loaded_buffer_delete')
	finish
endif
let g:loaded_buffer_delete = 1

command! BufferDeleteUnloaded call buffer_delete#Unloaded()
