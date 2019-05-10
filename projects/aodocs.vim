augroup AODocs
	autocmd!

	autocmd BufRead $VIM_PROJECT_PATH_AODOCS_GO/ufo-client/client/*.go
		\ silent GoGuruScope github.com/Revevol-Apps/ufo-client/client
augroup END
