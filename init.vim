source $XDG_CONFIG_HOME/nvim/vimrc

set backupdir=$XDG_CONFIG_HOME/nvim/backup/backup//
set directory=$XDG_CONFIG_HOME/nvim/backup/swap//
set undodir=$XDG_CONFIG_HOME/nvim/backup/undo//

lua <<EOF
require'lspconfig'.dartls.setup{}
EOF

nnoremap <leader>ca :lua vim.lsp.buf.code_action()<CR>
