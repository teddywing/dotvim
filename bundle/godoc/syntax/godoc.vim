if exists("b:current_syntax")
	finish
endif

runtime! syntax/go.vim

" Character highlighting breaks highlighting when text blocks use apostrophes.
syntax clear goCharacter

" Some packages don't balance "`" quotes correctly, causing overflowing raw
" string highlighting.
syntax clear goRawString
