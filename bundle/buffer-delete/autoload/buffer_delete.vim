" Delete all unloaded buffers. These are buffers that aren't active or hidden.
" Usually they come from a reinitialised session.
function! buffer_delete#Unloaded()
	let all = range(1, bufnr('$'))
	let unloaded = filter(all, {_i, v -> !bufloaded(v)})

	for i in unloaded
		" Use silent because some buffer numbers may not exist.
		silent! execute 'bdelete ' . i
	endfor
endfunction
