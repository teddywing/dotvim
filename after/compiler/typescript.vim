" Run tsc on all files. The typescript.vim plugin only operates on the current
" file.
execute 'CompilerSet makeprg='
	\ . escape(g:typescript_compiler_binary, ' ')
	\ . '\ '
	\ . escape(g:typescript_compiler_options, ' ')
	\ . '\ $*'
