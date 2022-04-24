" The vim-go plugin uses Vimscript syntax that isn't valid below Vim 7.4.
" Disable the plugin in earlier Vim versions.
if v:version < 704
	let g:go_loaded_install = 1
endif
