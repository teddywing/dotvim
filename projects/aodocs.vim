augroup AODocs
	autocmd!

	autocmd BufRead $VIM_PROJECT_PATH_AODOCS_GO/ufo-client/client/*.go
		\ silent GoGuruScope github.com/Revevol-Apps/ufo-client/client

	autocmd BufRead,BufEnter $VIM_PROJECT_PATH_AODOCS/*.js
		\ setlocal expandtab tabstop=2 softtabstop=2 shiftwidth=2

	autocmd BufRead,BufEnter $VIM_PROJECT_PATH_AODOCS/*.json
		\ setlocal expandtab tabstop=4 softtabstop=4 shiftwidth=4
augroup END
