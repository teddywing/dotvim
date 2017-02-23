" Read a month from the `cal` command and format it to add an extra space
" between each column and indent the calendar.
"
" Examples:
" InsertFormattedCal(3)
" InsertFormattedCal(3, 2017)
"
" Original:
"      March 2017
" Su Mo Tu We Th Fr Sa
"           1  2  3  4
"  5  6  7  8  9 10 11
" 12 13 14 15 16 17 18
" 19 20 21 22 23 24 25
" 26 27 28 29 30 31
"
" Result:
" 	      March 2017
" 	 Su  Mo  Tu  We  Th  Fr  Sa
" 	              1   2   3   4
" 	  5   6   7   8   9  10  11
" 	 12  13  14  15  16  17  18
" 	 19  20  21  22  23  24  25
" 	 26  27  28  29  30  31
function! insert_formatted_cal#InsertFormattedCal(month, ...)
	let year = a:0 ==# 0 ? system("date +'%Y'") : a:1

	normal! m'
	execute 'read !cal ' . a:month . ' ' . year
	normal! ''

	" Add an extra space between columns
	normal! 2j
	silent .,+6s/ /  /g

	" Remove an extra space from single-digit rows
	normal! 4k
	silent .,+2s/   /  /g

	" Remove the extra initial space from single-digit rows
	normal! k
	silent .,+1s/^ //

	" Entab the calendar
	normal! 3k
	silent .,+6s/^/\t /
endfunction
