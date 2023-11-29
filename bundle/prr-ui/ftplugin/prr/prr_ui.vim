let b:undo_ftplugin = ''

command! -buffer PrrApprove
	\ normal! ggOLooks good <C-r>=prr_ui#RandomEmoji()<CR><CR><CR>@prr approve<CR><Esc>gg
command! -buffer PrrReject normal! ggO<CR><CR>@prr reject<CR><Esc>gg

let b:undo_ftplugin .= '| delcommand -buffer PrrApprove'
let b:undo_ftplugin .= '| delcommand -buffer PrrReject'

" Educate quotes.
if !exists('b:textobj_quote_educate_mapped')
\ || b:textobj_quote_educate_mapped == 0
	Educate
	let b:undo_ftplugin .= '| NoEducate'
endif
