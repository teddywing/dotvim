" Ruby vim settings

" Indentation
setlocal expandtab
setlocal tabstop=2
setlocal softtabstop=2
setlocal shiftwidth=2


" Debugging
nnoremap <buffer> Zd obyebug<Esc>
nnoremap <buffer> ZD Obyebug<Esc>


" RSpec
nnoremap <buffer> <leader>z :call RunCurrentSpecFile() \| call system("date '+%FT%T%z: z' >> ~/.vim/spec-stats.log")<cr>
nnoremap <buffer> <leader>Z :call RunNearestSpec() \| call system("date '+%FT%T%z: Z' >> ~/.vim/spec-stats.log")<cr>
nnoremap <buffer> 🕳 :call RunCurrentSpecFile() \| call system("date '+%FT%T%z: e' >> ~/.vim/spec-stats.log")<cr>
nnoremap <buffer> ⛳ :call RunNearestSpec() \| call system("date '+%FT%T%z: E' >> ~/.vim/spec-stats.log")<cr>


" Reset Rails test database
nnoremap <buffer> <F7> :!RAILS_ENV=test bundle exec rake db:reset<CR>


" Spring
command! -buffer FuckSpring :!bundle exec spring stop


" Convert from old to new hash syntax
" Example: :%RubyNewHashSyntax gc
command! -buffer -range -nargs=? RubyNewHashSyntax
	\ <line1>,<line2>substitute/\v:<(\w+)> \=\>/\1:/<args>
