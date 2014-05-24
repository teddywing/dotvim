" Teddy Wing
" http://www.teddywing.com
"
" 2010.11.06
"
" CHANGELOG:
"   2014.04.03:
"       * Add Shift-Tab mapping to exit Insert mode
"
"   2014.04.11:
"       * Preserve indentation on blank lines
"
"   2014.04.12:
"       * Add leader and symbols for showing invisible characters
"         (http://vimcasts.org/episodes/show-invisibles/)
"       * Remove `set expandtab`
"       * Add `set softtabstop=4`
"       * Add function from Vimcasts to set tab width
"       * Add normal mode mapping to toggle expandtab
"       * Add <leader>[ and ] indentation to retain selection when indenting
"       * Add `set hidden`
"       * Add `set list`
"       * Add soft wrap
"       * Source .vimrc whenever it has been saved
"
"   2014.04.15:
"       * Add pathogen
"       * Add twilight256 colour scheme
"       * Add NERD Tree
"       * Add Command-T
"       * Remap Command-T from <leader>t to <leader>d
"       * Set switchbuf=usetab,newtab
"       * Map Control-h to :update
"
"   2014.04.16:
"       * Set NERDTree sort order such that all files & directories are sorted
"         alphabetically, instead of directories appearing above files.
"       * Set NERDTree default width to 24 columns
"       * Map j -> gj and k -> gk for moving on wrapped lines
"       * Set noendofline
"       * Add project-level indentation settings for Flashnotes
"       * Remove <leader>t <nop> mapping because Command-T will not overwrite 
"         a pre-existing mapping
"       * Install TabBar for buffer tabs, add mappings to access tabs using 
"         <leader> commands
"       * Map Shift-Tab to Esc in normal mode in addition to Insert & Visual
"       * Install commentary.vim and set comment strings for Ruby, JavaScript, 
"         SCSS, HTML, Python
"
"   2014.04.17:
"       * Remove `set :noendofline` as it wasn't doing what I wanted it to do
"       * Add & set PreserveNoEOL plugin to preserve file EOL
"       * Move commentary.vim autocmds into an augroup
"       * Always show status line
"       * Make custom status line
"       * Change `vb` setting to unabbreviated form, `visualbell`
"       * Change 'set' to 'setlocal' in my autocommands
"
"   2014.04.18:
"       * Add mappings for easier buffer switching (leader-j, leader-k, 
"         leader-bx)
"       * Use 'a' instead of 'i' in my Control-h save mapping because we want 
"         to return to the same cursor position
"       * Map <leader>bl to list buffers
"
"   2014.04.19:
"       * Set `timeoutlen` to 500 milliseconds
"
"   2014.04.20:
"       * Install EasyGrep plugin and add configuration for EasyGrepCommand=1, 
"         EasyGrepRecursive=1, EasyGrepEveryMatch=1, 
"         EasyGrepReplaceAllPerFile=1
"       * Set grepprg=ack
"       * Add an extra line of spacing between sections and '===' underlines 
"         below main headings
"       * Move project-specific settings into ~/.vim/projects and source all 
"         files in that directory
"
"   2014.04.23:
"       * Set EasyGrep to be case insensitive by default
"
"   2014.04.25:
"       * Map <leader>/ to clear search highlighting
"       * Map gj -> j and gk -> k so we can still skip wrapped lines if we want
"       * Set ignorecase and smartcase
"       * Add file encoding to statusline
"
"   2014.04.28:
"       * Add augroup for custom syntax highlighting by filetype
"       * Add autocmd to set .json files to use JavaScript syntax highlighting 
"         and have a json filetype
"
"   2014.04.30:
"       * Set backupdir, directory, and undodir to be within ~/.vim so that my 
"         filesystem doesn't clutter with *.swp files and the like
"
"   2014.05.01:
"       * Change status bar colour from white to green when switching into and 
"         out of insert mode
"
"   2014.05.02:
"       * Add augroup for filetype indentation settings
"       * Set gitcommit files to use 2-space indentation
"       * Remove `switchbuf=usetab,newtab` setting because it doesn't work 
"         with my current workflow. Now when I use EasyGrep the files opened 
"         from the Quickfix window will open in the same tab instead of a new 
"         tab, which is less of a surprise and context switch.
"
"   2014.05.08:
"       * Add Indent Guides plugin to show tab stops
"       * Remap Indent Guides toggle command to <leader>ts
"       * Set Indent Guides size to 1 column (only works for expandtab)
"       * Set custom colours for Indent Guides that are a little less intrusive
"
"   2014.05.11:
"       * Add camelcasemotion plugin for moving inside camelCase and 
"         under_score words
"
"   2014.05.12:
"       * Map <leader>tn to :tabnew
"
"   2014.05.13:
"       * Create function and command for "Copy Mode". A quick way to remove 
"         line numbers and invisibles so that text can be selected and copied 
"         at the OS level.
"
"   2014.05.14:
"       * Add commentary.vim definition for the "htmldjango" filetype
"
"   2014.05.15:
"       * Turn on filetype plugin so that I can have filetype-specific 
"         settings in their own files instead of having them clutter my vimrc
"       * Add a filetype plugin file for python, specifying PEP8 indentation 
"         and ensuring indentation is not preserved on blank lines.
"
"   2014.05.17:
"       * Move JSON filetype detection from vimrc to ftdetect/json.vim. Now 
"         that I know that such things exist, it's nice to keep things 
"         organised.
"       * Add autocmd to disable default ftplugins. Don't like a lot of the 
"         default behaviours. Note that this doesn't work for some reason and 
"         I can't figure out why or what to do. Keep searching.
"
"   2014.05.23:
"       * Get disabling of default ftplugins working. Turns out it shouldn't 
"         have been in an autocmd as recommended in 
"         http://vim.wikia.com/wiki/Default_filetype#Setting_a_default_filetype
"         and http://marc.info/?l=vim&m=100254210012793&w=2. Instead the 
"         variable needed to be set directly.
"       * Move gitcommit indentation settings from vimrc to ftplugin/gitcommit
"


" Pathogen
" ========
runtime bundle/vim-pathogen/autoload/pathogen.vim
execute pathogen#infect()
call pathogen#helptags()



" Default configuration
" =====================
set visualbell t_vb=      " Turn off error beep

set autoindent
set tabstop=4     " Use 4-space tabs
set softtabstop=4 " Allow delete to remove indent when expandtab is enabled
set shiftwidth=4
" set expandtab

set wrap          " Soft wrap
set linebreak     " Don't wrap in the middle of words. Only works when nolist is set

set scrolloff=3   " Scroll offset: always keep 3 lines

set showmatch     " Highlight matching braces etc.
set hlsearch      " Highlight searches
set incsearch     " Search for text as you enter it

set ruler         " Show cursor position
set number        " Show line numbers

set list          " Show invisibles by default

set hidden        " Don't raise errors when switching buffers with unsaved changes

set timeoutlen=500    " If <leader>bl and <leader>b are both mapped, wait 0.5 
                      " seconds instead of 1 second to fire <leader>b if no l 
                      " is pressed subsequently

set grepprg=ack   " Use ack instead of grep

set ignorecase    " Case insensitive
set smartcase     " Case insensitive unless an uppercase character is entered

" Store swap files in .vim/ directory
" http://stackoverflow.com/a/15317146
set backupdir=~/.vim/backup/backup//
set directory=~/.vim/backup/swap//
set undodir=~/.vim/backup/undo//

" Disable all default ftplugins
let b:did_ftplugin = 1

" Enable filetype-specific settings
filetype plugin on

set laststatus=2  " Always show the status line

" Statusline
set statusline=%f     " Path to file
set statusline+=\     " Separator
set statusline+=%y    " Filetype
set statusline+=\     " Separator
                      " File encoding
                      " (http://vim.wikia.com/wiki/Show_fileencoding_and_bomb_in_the_status_line)
set statusline+=%{\"[\".(&fenc==\"\"?&enc:&fenc).((exists(\"+bomb\")\ &&\ &bomb)?\",B\":\"\").\"]\ \"}
set statusline+=\     " Separator
set statusline+=%m    " File modified? flag
set statusline+=%r    " Readonly? flag
set statusline+=\     " Separator
set statusline+=-b%n- " Buffer number as -b{buffer #}-
set statusline+=\     " Separator
set statusline+=%=    " Switch to right side
set statusline+=%5l   " Line number (ensure space for 5 characters)
set statusline+=,     " Comma separator
set statusline+=%-8c  " Column number (ensure space for 8 characters)
set statusline+=\     " Separator
set statusline+=%4P   " Percent through file in window (ensure space for 4 characters)



" Syntax highlighting (base)
" ==========================
syntax on         " Syntax highlighting

hi Comment    ctermfg=green     guifg=#919191   cterm=none
hi Constant   ctermfg=red       guifg=#1C4B80   cterm=none
"hi Identifier 
hi Statement  ctermfg=blue      guifg=#696EC0
hi PreProc    ctermfg=brown     guifg=#73371C
hi Type       ctermfg=cyan      guifg=#696EC0
hi Special    ctermfg=red       guifg=#696EC0
hi Normal     ctermfg=black     guifg=#dddddd   guibg=#09192F

" Invisible character colours
hi NonText    guifg=#4a4a59
hi SpecialKey guifg=#4a4a59

set guifont=Monaco\ 10


" Set Twilight theme
colorscheme twilight256


" Change statusline color when entering & leaving Insert mode
" Only when colourscheme is 'twilight256'
if exists('g:colors_name') && g:colors_name ==# 'twilight256'
	augroup statusline_color_on_mode_change
		autocmd!
		
		autocmd InsertEnter * highlight statusline ctermfg=120 ctermbg=234
		autocmd InsertLeave * highlight statusline ctermfg=15 ctermbg=235
	augroup END
endif



" Plugins
" =======

" Command-T
" Remap Command-T from <leader>t to <leader>d (BBEdit style)
nnoremap <leader>d :CommandT<cr>


" NERDTree
" Alphabetical sort ordering
let NERDTreeSortOrder = []
let NERDTreeWinSize = 24

" Toggle NERDTree with leader command
nnoremap <leader>f :NERDTreeToggle<cr>


" TabBar
" j/k to switch to previous/next buffer tab
nnoremap <leader>j :Tbbp<cr>
nnoremap <leader>k :Tbbn<cr>

" Leader+# to switch to a specific buffer tab
nnoremap <leader>1 :TbBfSwitchTo 1<cr>:<bs>
nnoremap <leader>2 :TbBfSwitchTo 2<cr>:<bs>
nnoremap <leader>3 :TbBfSwitchTo 3<cr>:<bs>
nnoremap <leader>4 :TbBfSwitchTo 4<cr>:<bs>
nnoremap <leader>5 :TbBfSwitchTo 5<cr>:<bs>
nnoremap <leader>6 :TbBfSwitchTo 6<cr>:<bs>
nnoremap <leader>7 :TbBfSwitchTo 7<cr>:<bs>
nnoremap <leader>8 :TbBfSwitchTo 8<cr>:<bs>
nnoremap <leader>9 :TbBfSwitchTo 9<cr>:<bs>
nnoremap <leader>0 :TbBfSwitchTo 10<cr>:<bs>

inoremap <leader>1 :TbBfSwitchTo 1<cr>:<bs>a
inoremap <leader>2 :TbBfSwitchTo 2<cr>:<bs>a
inoremap <leader>3 :TbBfSwitchTo 3<cr>:<bs>a
inoremap <leader>4 :TbBfSwitchTo 4<cr>:<bs>a
inoremap <leader>5 :TbBfSwitchTo 5<cr>:<bs>a
inoremap <leader>6 :TbBfSwitchTo 6<cr>:<bs>a
inoremap <leader>7 :TbBfSwitchTo 7<cr>:<bs>a
inoremap <leader>8 :TbBfSwitchTo 8<cr>:<bs>a
inoremap <leader>9 :TbBfSwitchTo 9<cr>:<bs>a
inoremap <leader>0 :TbBfSwitchTo 10<cr>:<bs>a


" commentary.vim
augroup commentaryvim
	autocmd!
	autocmd FileType ruby setlocal commentstring=#\ %s
	autocmd FileType html setlocal commentstring=<!--\ %s\ -->
	autocmd FileType htmldjango setlocal commentstring=<!--\ %s\ -->
	autocmd FileType javascript setlocal commentstring=//\ %s
	autocmd FileType scss setlocal commentstring=//\ %s
	autocmd FileType python setlocal commentstring=#\ %s
augroup END


" PreserveNoEOL
let g:PreserveNoEOL = 1


" EasyGrep
let g:EasyGrepCommand = 1    " Use grep instead of vimgrep
let g:EasyGrepRecursive = 1  " Recursive search enabled
let g:EasyGrepEveryMatch = 1 " Multiple matches on the same line are distinct
let g:EasyGrepIgnoreCase = 1
let g:EasyGrepReplaceAllPerFile = 1


" Indent Guides
let g:indent_guides_guide_size = 1           " Set guide size to 1 column
let g:indent_guides_default_mapping = 0      " Remove default <leader>ig mapping

" Set mapping to ts for "Tab Stop"
nnoremap <leader>ts :IndentGuidesToggle<cr>

" Set colours for indent guides
if exists('g:colors_name') && g:colors_name ==# 'twilight256'
	" Turn off automatic colours
	let g:indent_guides_auto_colors = 0
	
	autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  ctermbg=238
	autocmd VimEnter,Colorscheme * :hi IndentGuidesEven ctermbg=238
endif



" Mappings
" ========

" Shift-Tab to enter normal mode from insert mode
nnoremap <S-Tab> <Esc>
inoremap <S-Tab> <Esc>
vnoremap <S-Tab> <Esc>

" Control-h to save (Why 'h'? Because it seemed to be a non-important combo 
" across modes, and because bash by default doesn't let me map Control-s)
nnoremap <c-h> <esc>:update<cr>
inoremap <c-h> <esc>:update<cr>a
vnoremap <c-h> <esc>:update<cr>v

" Preserve indentation on empty lines
" http://stackoverflow.com/a/7413117
inoremap <CR> <CR>x<BS>
nnoremap o ox<BS>
nnoremap O Ox<BS>

" Show invisibles with <leader>i
nnoremap <leader>i :set list!<cr>

" Use TextMate-style symbols for tabs and EOLs
set listchars=tab:▸\ ,eol:¬

" Toggle between tab and space indentation
nnoremap <leader>st :set expandtab! expandtab?<cr>

" OS X-style indentation, retains selection when indenting
" http://vimcasts.org/episodes/indentation-commands/
nnoremap <leader>[ <<
nnoremap <leader>] >>
vnoremap <leader>[ <gv
vnoremap <leader>] >gv

" Allow easy moving to wrapped lines
nnoremap j gj
nnoremap k gk
nnoremap gj j
nnoremap gk k

" Easier buffer switching
nnoremap <leader>bl :ls<cr>
nnoremap <leader>j :bnext<cr>
nnoremap <leader>k :bprevious<cr>

" Close buffer without closing split
" http://stackoverflow.com/a/4468491
nnoremap <leader>bx :bp \| bd #<cr>

" Clear search highlighting
nnoremap <leader>/ :nohlsearch<cr>

" Tabs
nnoremap <leader>tn :tabnew<cr>


" Commands
" ========

" Set tabstop, softtabstop and shiftwidth to the same value
" http://vimcasts.org/episodes/tabs-and-spaces/
command! -nargs=* Stab call Stab()
function! Stab()
  let l:tabstop = 1 * input('set tabstop = softtabstop = shiftwidth = ')
  if l:tabstop > 0
    let &l:sts = l:tabstop
    let &l:ts = l:tabstop
    let &l:sw = l:tabstop
  endif
  call SummarizeTabs()
endfunction
  
function! SummarizeTabs()
  try
    echohl ModeMsg
    echon 'tabstop='.&l:ts
    echon ' shiftwidth='.&l:sw
    echon ' softtabstop='.&l:sts
    if &l:et
      echon ' expandtab'
    else
      echon ' noexpandtab'
    endif
  finally
    echohl None
  endtry
endfunction


" Swap between soft wrapping and no wrapping
" http://vimcasts.org/episodes/soft-wrapping-text/
command! -nargs=* Wrap set wrap linebreak nolist


" Remove line numbers and invisibles so that text can be selected for an OS copy
let b:copy_mode_enabled = 0
let b:copy_mode_number = &l:number
let b:copy_mode_list = &l:list
function! CopyModeToggle()
	if b:copy_mode_enabled
		let &l:number = b:copy_mode_number
		let &l:list = b:copy_mode_list
		let b:copy_mode_enabled = 0
	else
		let b:copy_mode_number = &l:number
		let b:copy_mode_list = &l:list
		set nonumber nolist
		let b:copy_mode_enabled = 1
	endif
endfunction

command! CopyModeToggle call CopyModeToggle()



" Autocommands
" ============

" Source the vimrc file after saving it
" http://vimcasts.org/episodes/updating-your-vimrc-file-on-the-fly/
" if has("autocmd")
"   autocmd bufwritepost .vimrc source $MYVIMRC
" endif



" Project Settings
" ================

" Source all files in the ~/.vim/projects directory
" http://stackoverflow.com/a/4500936
for f in split(glob('~/.vim/projects/*.vim'), '\n')
	execute 'source' f
endfor

