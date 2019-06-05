if exists('g:loaded_jira_text_formatting_notation_help')
	finish
endif
let g:loaded_jira_text_formatting_notation_help = 1

command! JiraTextFormattingNotationHelp
	\ :call jira_text_formatting_notation_help#Open()
