" Cycle
" Cycle the 'spelllang' option through a set of languages. The `direction`
" argument specifies whether to move left or right (and how much to move) in
" the list.
"
" Derived from `CycleLang` as written by kev here:
" http://stackoverflow.com/questions/12006508/vim-how-to-cycle-through-a-list-of-options-using-the-same-key/12006781#12006781
function! spellcycle#Cycle(direction)
	let languages = ['en', 'fr']

	let i = index(languages, &spelllang)
	let cycled_index = (i + a:direction) % len(languages)
	let &spelllang = languages[cycled_index]

	set spelllang?
endfunction
