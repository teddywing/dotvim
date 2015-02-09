" Unimpaired VCS Conflict Movement
" Merge conflict movement helper copied from Tim Pope's unimpaired.vim
" Copied directly from 
" https://github.com/tpope/vim-unimpaired/blob/3548479cc154154cbdbb6737ca08a47937cc7113/plugin/unimpaired.vim#L102-L144
"
" I didn't want the full Unimpaired plugin, so just copying this part for now 
" because it's something I've wanted for a while.
"
" Note that this file should not be considered to have the same license as the 
" rest of the repo. As the code was copied wholesale from unimpaired.vim, this 
" file retains the license from the plugin as of 2015.02.09, namely the Vim 
" license.

nmap [n <Plug>unimpairedContextPrevious
nmap ]n <Plug>unimpairedContextNext
omap [n <Plug>unimpairedContextPrevious
omap ]n <Plug>unimpairedContextNext

nnoremap <silent> <Plug>unimpairedContextPrevious :call unimpaired_vcs_conflict_movement#Context(1)<CR>
nnoremap <silent> <Plug>unimpairedContextNext     :call unimpaired_vcs_conflict_movement#Context(0)<CR>
onoremap <silent> <Plug>unimpairedContextPrevious :call unimpaired_vcs_conflict_movement#ContextMotion(1)<CR>
onoremap <silent> <Plug>unimpairedContextNext     :call unimpaired_vcs_conflict_movement#ContextMotion(0)<CR>
