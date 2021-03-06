.vim
====

My personal vim config. Includes various mappings and plugins. Plugins are loaded with [pathogen.vim](https://github.com/tpope/vim-pathogen).

Feel free to take a look and copy what you like.


## Installation
1. Backup your `.vimrc` and `.vim` directory
2. Clone into your `~/.vim` directory
3. Run `git submodule init && git submodule update`
4. Link `.vimrc` to `~/.vim/vimrc`

		ln -s .vim/vimrc .vimrc


## Dependencies
Currently requires:

* `ack`: for more intelligent project searching


## Plugins
* [pathogen.vim](https://github.com/tpope/vim-pathogen): plugin management
* [PreserveNoEOL](https://github.com/vim-scripts/PreserveNoEOL/): preserve EOLs
* [Indent Guides](https://github.com/nathanaelkane/vim-indent-guides): show tab stops
* [camelcasemotion](https://github.com/vim-scripts/camelcasemotion): move inside camelcase and underscored words
* [Gundo](http://sjl.bitbucket.org/gundo.vim/): visual view of vim's undo tree
* [surround.vim](https://github.com/tpope/vim-surround): easier manipulation of "surrounding" characters
* [golang](https://github.com/jnwhiteh/vim-golang): mirror of the official go vim plugins
* [scala](https://github.com/derekwyatt/vim-scala): plugin for Scala development
* [tcomment](https://github.com/tomtom/tcomment_vim): easy code commenting
* [ag.vim](https://github.com/rking/ag.vim): ag search integration
* [pick.vim](https://github.com/thoughtbot/pick.vim): fast file & buffer opening
* [System Copy](https://github.com/christoomey/vim-system-copy): operator-pending function to copy text to the system clipboard


## License
Licensed under the MIT license. See the included LICENSE file.
