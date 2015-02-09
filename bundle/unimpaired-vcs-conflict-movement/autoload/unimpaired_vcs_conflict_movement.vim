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

function! unimpaired_vcs_conflict_movement#Context(reverse)
  call search('^@@ .* @@\|^[<=>|]\{7}[<=>|]\@!', a:reverse ? 'bW' : 'W')
endfunction

function! unimpaired_vcs_conflict_movement#ContextMotion(reverse)
  if a:reverse
    -
  endif
  call search('^@@ .* @@\|^diff \|^[<=>|]\{7}[<=>|]\@!', 'bWc')
  if getline('.') =~# '^diff '
    let end = search('^diff ', 'Wn') - 1
    if end < 0
      let end = line('$')
    endif
  elseif getline('.') =~# '^@@ '
    let end = search('^@@ .* @@\|^diff ', 'Wn') - 1
    if end < 0
      let end = line('$')
    endif
  elseif getline('.') =~# '^=\{7\}'
    +
    let end = search('^>\{7}>\@!', 'Wnc')
  elseif getline('.') =~# '^[<=>|]\{7\}'
    let end = search('^[<=>|]\{7}[<=>|]\@!', 'Wn') - 1
  else
    return
  endif
  if end > line('.')
    execute 'normal! V'.(end - line('.')).'j'
  elseif end == line('.')
    normal! V
  endif
endfunction
