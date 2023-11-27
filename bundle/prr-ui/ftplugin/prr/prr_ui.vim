let b:undo_ftplugin = ''

" TODO: Pick an emoji at random from a pre-defined list.
command! -buffer PrrApprove normal! ggOLooks good <CR><CR>@prr approve<CR><Esc>
command! -buffer PrrReject normal! ggO<CR><CR>@prr reject<CR><Esc>

let b:undo_ftplugin .= '| delcommand -buffer PrrApprove'
let b:undo_ftplugin .= '| delcommand -buffer PrrReject'
