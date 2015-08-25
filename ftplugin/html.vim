" HTML settings

" matchit settings (for % matching)
" Copied from vim's default HTML ftplugin. I just want this, not the rest. My 
" preference is still to disable all non-custom ftplugins.
if exists("loaded_matchit")
    let b:match_ignorecase = 1
    let b:match_words = '<:>,' .
    \ '<\@<=[ou]l\>[^>]*\%(>\|$\):<\@<=li\>:<\@<=/[ou]l>,' .
    \ '<\@<=dl\>[^>]*\%(>\|$\):<\@<=d[td]\>:<\@<=/dl>,' .
    \ '<\@<=\([^/][^ \t>]*\)[^>]*\%(>\|$\):<\@<=/\1>'
endif


" Include hyphen in the keyword list so that CSS class names can be autocompleted
setlocal iskeyword+=-
