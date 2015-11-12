" Copy
"
" Takes a range and copies the lines specified to the system clipboard.

command! -range Copy call copy#Copy(<line1>, <line2>)
