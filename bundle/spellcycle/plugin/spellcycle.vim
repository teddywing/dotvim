if exists('g:loaded_spellcycle')
	finish
endif
let g:loaded_spellcycle = 1


nnoremap <silent> <Plug>spellcycle_Left  :<c-u>call spellcycle#Cycle(-1)<cr>
nnoremap <silent> <Plug>spellcycle_Right :<c-u>call spellcycle#Cycle(1)<cr>

nmap [l <Plug>spellcycle_Left
nmap ]l <Plug>spellcycle_Right
