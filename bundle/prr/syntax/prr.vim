" Vim syntax file
" Language:     prr
" Maintainer:   Daniel Xu <dxu@dxuuu.xyz>
" Last Change:  2022 Mar 25
" Credits:      Bram Moolenaar <Bram@vim.org>
"
"               This version is copied and edited from diff.vim
"
" Copyright (c) 2022  Daniel Xu
"
" This program is free software; you can redistribute it and/or modify
" it under the terms of the GNU General Public License as published by
" the Free Software Foundation; either version 2 of the License, or
" (at your option) any later version.
"
" This program is distributed in the hope that it will be useful,
" but WITHOUT ANY WARRANTY; without even the implied warranty of
" MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
" GNU General Public License for more details.
"
" You should have received a copy of the GNU General Public License along
" with this program; if not, write to the Free Software Foundation, Inc.,
" 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.

" Check whether an earlier file has defined a syntax already
if exists("b:current_syntax")
  finish
endif

syn match diffAdded     "^> +.*"
syn match diffRemoved   "^> -.*"

" Define the default highlighting.
" Only used when an item doesn't have highlighting yet
hi def link diffAdded           Identifier
hi def link diffRemoved         Special

let b:current_syntax = "prr"
