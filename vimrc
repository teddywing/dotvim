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
"   2014.05.25:
"       * If in insert mode I press Ctrl-u to delete a line or Ctrl-w to 
"         delete a word, add those changes to the undo history so that I can 
"         go back and don't have to remember what I typed if I want to undo.
"       * Add <leader>gu mapping to toggle Gundo
"       * Set `cursorline` to highlight the current line. Shame it doesn't 
"         play nice with soft wrapping but I'm going to try it out for now.
"
"   2014.05.26:
"       * Add :cnext and :cprevious mappings for easier navigation in the 
"         quickfix window. Key pairs taken from Tim Pope's unimpaired.vim.
"       * Delete `Stab` command now that I moved it to its own plugin. Makes 
"         for better code organisation and a leaner vimrc.
"
"   2014.05.28:
"       * Get disabling of default ftplugins working (finally). Turns out my 
"         prior change to get them working only worked for the first opened 
"         buffer (obviously in retrospect). Here, use BufReadPre to set the 
"         buffer variable for all buffers that get opened.
"
"   2014.05.29:
"       * Add <leader>sb to set scrollbinding so I can quickly set two windows 
"         to scroll together
"
"   2014.05.30:
"       * Add <leader>tx to delete the current buffer and go to the previous 
"         tab. When I use :bd it goes to the next tab but more often I want to 
"         go back to the previous tab.
"       * Colour even Indent Guides differently (make them slightly lighter 
"         than the odd ones). Originally I thought it was distracting but I 
"         just caved. Much easier to follow the line when it gets really long 
"         if it's a different colour than its neighbors.
"       * Add a leader command to go to the last active tab. Make it easier to 
"         back and forth between tabs.
"
"   2014.06.02:
"       * Change <leader>tx to <leader>td. Typing "tx" is too uncomfortable.
"
"   2014.06.03:
"       * Ignore "vendor/" directories when searching in Command-T. Makes it 
"         easier to search in Ruby projects.
"       * Save an undo (using Ctrl-g + u) when saving in Insert mode. It didn't 
"         appear to be doing so before and I want to make sure that an undo 
"         entry is created every time I save.
"
"   2014.06.05:
"       * Map 0 -> g0 and $ -> g$ plus the reverse. Makes it easier to get to 
"         the beginning & end of a soft wrapped line.
"
"   2014.06.06:
"       * Add Visual mode mapping to copy selected text to the OS X clipboard 
"         since I'm using stock vim not compiled with clipboard support.
"       * Add mapping to open the current file in TextMate. Occasionally it's 
"         useful to open the file in a different editor.
"
"   2014.06.09:
"       * Add mapping to open the current file's directory in Finder. Useful 
"         for quickly modifying the filename or interacting with the file 
"         directly in other ways.
"
"   2014.06.19:
"       * Fix 'Open in TextMate' mapping: allow paths with spaces
"       * Fix 'Open path in Finder' mapping: allow paths with spaces
"
"   2014.06.25:
"       * Add mapping to CommandTFlush. Sometimes when I switch branches I'll 
"         have to do this and typing :co<Tab><Tab><Tab><CR> multiple times a 
"         day adds up.
"
"   2014.06.26:
"       * Update <c-h> save mapping in visual mode to reselect the last 
"         selected area
"
"   2014.06.27:
"       * Remove the space after the file encoding in the statusline
"       * Add a statusline item that says what line endings are used in the 
"         current file. "LF" is used for unix, "CRLF" is used for dos.
"
"   2014.06.28:
"       * Add mapping to split a line with multiple XML/HTML tags into multiple 
"         lines. Something I have to do every now and then and it's kind of a 
"         pain to do it manually.
"
"   2014.06.29:
"       * Remove TabBar plugin. I wasn't using it and it's been disabled for a 
"         while, so completely removing it. Delete mappings created for TabBar.
"       * Remove commentary.vim autocmds. After switching to tcomment these are 
"         no longer necessary. All the languages I was targeting are have 
"         built-in support with tcomment.
"
"   2014.07.02:
"       * Add the matchit plugin. Had a long HTML file and wanted to be able 
"         to go back & forth between an opening tag and closing tag that 
"         extended beyond the page. No more straining to follow a tab stop.
"
"   2014.07.06:
"       * Ignore `node_modules/` directory from Command-T.
"
"   2014.09.10:
"       * Add <leader>r mapping to reload the current file.
"
"   2014.10.30:
"       * Add <leader>tq to close a window and go to the previous tab. Works 
"         like <leader>td but doesn't delete the buffer.
"
"   2014.11.05:
"       * Add command mode mappings to allow movement forward and backward by 
"         word. OS X Terminal doesn't handle the Shift & Control mappings.
"
"   2014.11.12:
"       * Set sessionoptions-=options so that options and mappings are not 
"         saved in vim sessions.
"
"   2014.11.15:
"       * Add <leader>p mapping to read from the OS X pasteboard. Much faster 
"         than pasting directly if you're dealing with a lot of text.
"
"   2015.01.06:
"       * Set backupcopy=yes to preserve creation dates of files.
"
"   2015.06.02:
"       * Set g:netrw_liststyle=3 to take advantage of Netrw's tree listing, 
"         which functions more like NERDTree by not going to a new "page" when 
"         changing directories. With this change I think we can uninstall 
"         NERDTree.
"
"   2015.06.04:
"       * Add <leader>or mapping to open the current file in ranger.
"
"   2015.07.06:
"       * Remove EasyGrep configuration now that I've removed the plugin.
"       * Remove NERDTree configuration now that I've removed the plugin.
"
"   2015.07.09:
"       * Move Netrw settings to the Plugins section
"       * Set g:netrw_winsize=''. This should be the default but for some 
"         reason :Vexplore is always opening with the same width that I had 
"         previously defined for NERD Tree even though I've removed the plugin.
"         Turning on this setting because I can't for the life of me figure out
"         how the vertical explorer window size is getting set.
"       * Set g:netrw_sort_options='i' so that upper & lowercase files are 
"         mixed together
"
"   2015.07.10:
"       * Remove <leader>bl mapping because I'm not using it and have developed 
"         a preference for `:ls` instead.
"
"   2015.07.11:
"       * Remove CopyModeToggle command since I don't use it and it doesn't 
"         really work.
"       * Remove Autocommands section as it's not used.
"       * Disable auditory.vim
"
"   2015.07.12:
"       * Add pick mappings
"
"   2015.07.13:
"       * Use `find` as our pick.vim command in order to include untracked git 
"         files in the pick list.
"       * Add mappings to use pick.vim for opening buffers in new splits, 
"         vsplits, and tabs
"       * Remove Command-T configuration. Switching to pick.
"       * Update pick mappings to be more comfortable now that I've freed 
"         <leader>d.
"
"   2015.07.14:
"       * Turn on splitright
"       * Add <leader>bb mapping to pick a buffer to open in the current window
"
"   2015.07.21:
"       * Add mappings for Netrw :Explore, :Sexplore, :Vexplore, and :Rexplore
"
"   2015.07.23:
"       * Add mapping to open a new split that `git blame`s the current file
"       * Modify `git blame` mapping to open in less
"       * Modify `git blame` mapping to use custom git-blamer plugin
"       * Change pick command from `find` to `ag` for speed
"
"   2015.08.12:
"       * Add <leader>gp mapping to open the git log for the current file
"
"   2015.08.16:
"       * Remove `g:loaded_auditory` setting because Auditory sounds are off 
"         by default starting with v0.1.0.
"
"   2015.08.18:
"       * Add a mapping system copy the current file's path
"
"   2015.10.28:
"       * Add a mapping to open the current file in Chrome
"
"   2015.11.12:
"       * Output current scrollbind value after using our <leader>sb scrollbind 
"         toggle mapping.
"
"   2016.02.15:
"       * Add Slimv settings. Use `sbcl` Lisp interpreter and `screen` to run 
"         the REPL.
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

set cursorline    " Highlight the current line

set list          " Show invisibles by default

set hidden        " Don't raise errors when switching buffers with unsaved changes

set timeoutlen=500    " If <leader>bl and <leader>b are both mapped, wait 0.5 
                      " seconds instead of 1 second to fire <leader>b if no l 
                      " is pressed subsequently

set grepprg=ack   " Use ack instead of grep

set ignorecase    " Case insensitive
set smartcase     " Case insensitive unless an uppercase character is entered

set splitright    " Open vertical splits to the right of the current window

" Don't persist options & mappings in saved sessions
set sessionoptions-=options

" Store swap files in .vim/ directory
" http://stackoverflow.com/a/15317146
set backupdir=~/.vim/backup/backup//
set directory=~/.vim/backup/swap//
set undodir=~/.vim/backup/undo//

" Preserve file attributes, like creation date
set backupcopy=yes

" Disable all default ftplugins
" http://vim.wikia.com/wiki/File_type_plugins#Disabling_default_ftplugins
" http://stackoverflow.com/questions/11337129/setting-buffer-specific-variables-in-vim#comment14956146_11351393
augroup disable_all_default_ftplugins
	autocmd!
	autocmd BufReadPre * let b:did_ftplugin = 1
augroup END

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
set statusline+=%{\"[\".(&fenc==\"\"?&enc:&fenc).((exists(\"+bomb\")\ &&\ &bomb)?\",B\":\"\").\"]\"}
set statusline+=%{\"[\".(&fileformat==\"unix\"?\"LF\":(&fileformat==\"dos\"?\"CRLF\":\"\")).\"]\ \"}
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

" pick
let g:pick_command = "ag -l -a -g ''"

function! PickBufferListCommand()
  let bufnrs = filter(range(1, bufnr("$")), 'buflisted(v:val)')
  let buffers = map(bufnrs, 'bufname(v:val)')
  return 'echo "' . join(buffers, "\n") . '"'
endfunction

nnoremap <leader>dd :call PickCommand(g:pick_command, "", ":edit")<cr>
nnoremap <leader>ds :call PickCommand(g:pick_command, "", ":split")<cr>
nnoremap <leader>dv :call PickCommand(g:pick_command, "", ":vsplit")<cr>
nnoremap <leader>dt :call PickCommand(g:pick_command, "", ":tabedit")<cr>
nnoremap <leader>bb :call PickCommand(PickBufferListCommand(), "", ":edit")<cr>
nnoremap <leader>bs :call PickCommand(PickBufferListCommand(), "", ":split")<cr>
nnoremap <leader>bv :call PickCommand(PickBufferListCommand(), "", ":vsplit")<cr>
nnoremap <leader>bt :call PickCommand(PickBufferListCommand(), "", ":tabedit")<cr>
nnoremap <leader>d] :call PickTag()<cr>


" PreserveNoEOL
let g:PreserveNoEOL = 1


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
	autocmd VimEnter,Colorscheme * :hi IndentGuidesEven ctermbg=240
endif


" Gundo
nnoremap <leader>gu :GundoToggle<cr>


" Netrw
let g:netrw_liststyle = 3         " Use Netrw's tree-style listing
let g:netrw_winsize = ''          " Use default window size
let g:netrw_sort_options = 'i'    " Case-insensitive sort

nnoremap <leader>ff :Explore<cr>
nnoremap <leader>fs :Sexplore<cr>
nnoremap <leader>fv :Vexplore<cr>
nnoremap <leader>fr :Rexplore<cr>


" Source matchit for expanded % matching
runtime! macros/matchit.vim


" Slimv
let g:slimv_impl = 'sbcl'
let g:slimv_swank_cmd = '! screen -d -m -t REPL-SBCL sbcl --load ~/.vim/bundle/slimv/slime/start-swank.lisp'



" Mappings
" ========

" Shift-Tab to enter normal mode from insert mode
nnoremap <S-Tab> <Esc>
inoremap <S-Tab> <Esc>
vnoremap <S-Tab> <Esc>

" Control-h to save (Why 'h'? Because it seemed to be a non-important combo 
" across modes, and because bash by default doesn't let me map Control-s)
nnoremap <c-h> <esc>:update<cr>
inoremap <c-h> <c-g>u<esc>:update<cr>a
vnoremap <c-h> <esc>:update<cr>gv

" Preserve indentation on empty lines
" http://stackoverflow.com/a/7413117
inoremap <CR> <CR>x<BS>
nnoremap o ox<BS>
nnoremap O Ox<BS>

" Allow undo of Ctrl-u and Ctrl-w in insert mode
" http://vim.wikia.com/wiki/Recover_from_accidental_Ctrl-U
inoremap <c-u> <c-g>u<c-u>
inoremap <c-w> <c-g>u<c-w>

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

" Easier moving to the beginning & end of wrapped lines
nnoremap 0 g0
nnoremap $ g$
nnoremap g0 0
nnoremap g$ $

" Easier buffer switching
nnoremap <leader>j :bnext<cr>
nnoremap <leader>k :bprevious<cr>

" Close buffer without closing split
" http://stackoverflow.com/a/4468491
nnoremap <leader>bx :bp \| bd #<cr>

" Clear search highlighting
nnoremap <leader>/ :nohlsearch<cr>

" Tabs
nnoremap <leader>tn :tabnew<cr>

" Delete buffer and go to previous tab
nnoremap <leader>td :bdelete \| normal! gT<cr>

" Quit buffer and go to previous tab
nnoremap <leader>tq :quit \| normal! gT<cr>

" Go to last viewed tab
" http://stackoverflow.com/a/2120168
let g:last_viewed_tab = 1
augroup last_viewed_tab
	autocmd!
	autocmd TabLeave * let g:last_viewed_tab = tabpagenr()
augroup END
nnoremap <leader>tl :execute "tabnext " . g:last_viewed_tab<cr>

" Quickfix
nnoremap ]q :cnext<cr>
nnoremap [q :cprevious<cr>

" Set scrollbind on a window
nnoremap <leader>sb :setlocal scrollbind! scrollbind?<cr>

" Copy to OS X clipboard from visual mode
" http://stackoverflow.com/a/17126375
vnoremap <leader>c !tee >(pbcopy)<cr>

" Open current file in TextMate
nnoremap <leader>om :execute '!mate "' . expand('%:p') . '"'<cr>

" Open current file in Finder
nnoremap <leader>of :execute '!open "' . expand('%:p:h') . '"'<cr>

" Open current file in ranger
nnoremap <leader>or :execute '!ranger "' . expand('%:p:h') . '"'<cr>

" Open the current file in Chrome
nnoremap <leader>oc :execute '!open -a Google\ Chrome\ Canary "' . expand('%:p') . '"'<cr>

" HTML
" Split outer tag on a single line to multiple lines
" Example:
"   Before:
"     <a><span>The Land of Chocolate</span></a>
"   After:
"     <a>
"         <span>The Land of Chocolate</span>
"     </a>
"
" Thanks to kdlv on Freenode for helping me realise that I don't need :execute 
" "normal! " here. Turns out in the map, things like "\<cr>" are treated 
" literally (as in "\<lt>cr>"), which is of course not what I wanted.
nnoremap <leader>hs $F<i<cr><esc>k0f>a<cr><tab><esc>

" Reload current file (reopen to see changes made outside of vim)
nnoremap <leader>r :edit!<cr>

" Allow word movement in command mode
cnoremap <Esc>b <S-Left>
cnoremap <Esc>f <S-Right>

" Read from OS X pasteboard for faster pasting
nnoremap <leader>p :read !pbpaste<cr>

nnoremap <leader>gb :GitBlamer<cr>
nnoremap <leader>gp :!git log -p -- %<cr>

" Copy the current file path into the OS X pasteboard
nnoremap <leader>cf :call system('pbcopy', expand('%'))<cr>



" Commands
" ========

" Swap between soft wrapping and no wrapping
" http://vimcasts.org/episodes/soft-wrapping-text/
command! -nargs=* Wrap set wrap linebreak nolist



" Project Settings
" ================

" Source environment variables set to project paths
source ~/.vim/projects/file-paths.vim

" Source all files in the ~/.vim/projects directory
" http://stackoverflow.com/a/4500936
for f in split(glob('~/.vim/projects/*.vim'), '\n')
	execute 'source' f
endfor

