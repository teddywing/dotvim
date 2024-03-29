" Mail messages

if exists('b:did_ftplugin')
	unlet b:did_ftplugin
endif


" Automatically format paragraphs and set format=flowed "w" option
setlocal formatoptions+=aw

" Ensure that we don't end up with double spaces between sentences
setlocal nojoinspaces

setlocal spell


" Make bulleted lists with '*' not start wrapped lines with '*'
setlocal comments-=mb:* comments+=fb:*


" Remove last two empty lines below signature
nnoremap <buffer> <leader>e m`Gdk``


" Toggle paragraph auto-formatting
nnoremap <buffer> [a :setlocal formatoptions-=a<CR>
nnoremap <buffer> ]a :setlocal formatoptions+=a<CR>
