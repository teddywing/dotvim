" Ruby vim settings

" Indentation
setlocal expandtab
setlocal tabstop=2
setlocal softtabstop=2
setlocal shiftwidth=2


" Don't preserve indentation on empty lines
inoremap <buffer> <CR> <CR>
nnoremap <buffer> o o
nnoremap <buffer> O O


" Debugging
nnoremap <buffer> Zd obyebug<Esc>
nnoremap <buffer> ZD Obyebug<Esc>


" Reset Rails test database
nnoremap <buffer> <F7> :!RAILS_ENV=test bundle exec rake db:reset<CR>


" Spring
command! -buffer FuckSpring :!bundle exec spring stop


" Convert from old to new hash syntax
" Example: :%RubyNewHashSyntax gc
command! -buffer -range -nargs=? RubyNewHashSyntax
	\ <line1>,<line2>substitute/\v:<(\w+)> \=\>/\1:/<args>
