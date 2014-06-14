" Unimpaired Paste
" Paste helper copied from Tim Pope's unimpaired.vim
" Copied directly from "
" https://github.com/tpope/vim-unimpaired/blob/235be4ce59d3392b7f476814bb0d39de6c91bf2c/plugin/unimpaired.vim#L233-L254
"
" I didn't want the full Unimpaired plugin, so just copying this part for now 
" because it's something I've wanted for a while.
"
" Note that this file should not be considered to have the same license as the 
" rest of the repo. As the code was copied wholesale from unimpaired.vim, this 
" file retains the license from the plugin as of 2014.05.24, namely the Vim 
" license.

function! s:setup_paste() abort
  let s:paste = &paste
  let s:mouse = &mouse
  set paste
  set mouse=
endfunction

nnoremap <silent> <Plug>unimpairedPaste :call <SID>setup_paste()<CR>

nnoremap <silent> yo  :call <SID>setup_paste()<CR>o
nnoremap <silent> yO  :call <SID>setup_paste()<CR>O
nnoremap <silent> yi  :call <SID>setup_paste()<CR>i

augroup unimpaired_paste
  autocmd!
  autocmd InsertLeave *
        \ if exists('s:paste') |
        \   let &paste = s:paste |
        \   let &mouse = s:mouse |
        \   unlet s:paste |
        \   unlet s:mouse |
        \ endif
augroup END
