" Two commands that allow faster movement to the beginning and end of history

command! Earliest execute ':earlier ' . &undolevels
command! Latest execute ':later ' . &undolevels
