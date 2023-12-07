if !exists('g:loaded_copilot')
	finish
endif

imap <silent><script><expr> <C-g><C-y> copilot#Accept("\<CR>")

imap <C-g>e <Plug>(copilot-dismiss)
imap <C-g><C-e> <Plug>(copilot-dismiss)

imap <C-g>n <Plug>(copilot-next)
imap <C-g><C-n> <Plug>(copilot-next)

imap <C-g>p <Plug>(copilot-previous)
imap <C-g><C-p> <Plug>(copilot-previous)

imap <C-g>g <Plug>(copilot-suggest)
imap <C-g><C-g> <Plug>(copilot-suggest)

imap <C-g>w <Plug>(copilot-accept-word)
imap <C-g><C-w> <Plug>(copilot-accept-word)

imap <C-g>l <Plug>(copilot-accept-line)
imap <C-g><C-l> <Plug>(copilot-accept-line)
