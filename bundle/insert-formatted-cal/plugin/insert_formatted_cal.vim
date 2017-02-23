" CalFormattedInsert
" Inserts the specified month from the `cal` command with special formatting
" to use as an in-Vim calendar.
"
" Examples:
" :CalFormattedInsert 3
" :CalFormattedInsert 3 2017
command! -nargs=+ CalFormattedInsert call insert_formatted_cal#InsertFormattedCal(<f-args>)
