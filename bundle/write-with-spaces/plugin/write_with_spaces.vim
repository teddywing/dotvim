" Write with spaces
"
" Taken from iler.ml at 
" http://vim.1045645.n5.nabble.com/How-to-auto-escape-space-in-filename-when-write-tp1149064p1149065.html
"
" Provides a way to save files with spaces in their name

command! -bang -nargs=* -complete=file Write :call write_with_spaces#Write(<q-bang>, <q-args>)
