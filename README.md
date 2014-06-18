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
* [Command-T](https://github.com/wincent/Command-T): easy file loading
* [NerdTree](https://github.com/scrooloose/nerdtree): pleasant file browser
* [commentary.vim](https://github.com/tpope/vim-commentary): easy code commenting
* [PreserveNoEOL](https://github.com/vim-scripts/PreserveNoEOL/): preserve EOLs
* [EasyGrep](https://github.com/vim-scripts/EasyGrep): easy find and replace in project
* [Indent Guides](https://github.com/nathanaelkane/vim-indent-guides): show tab stops
* [camelcasemotion](https://github.com/vim-scripts/camelcasemotion): move inside camelcase and underscored words
* [Gundo](http://sjl.bitbucket.org/gundo.vim/): visual view of vim's undo tree
* [surround.vim](https://github.com/tpope/vim-surround): easier manipulation of "surrounding" characters
* [golang](https://github.com/jnwhiteh/vim-golang): mirror of the official go vim plugins
* [scala](https://github.com/derekwyatt/vim-scala): plugin for Scala development


Disabled plugins:

* [TabBar](https://github.com/vim-scripts/TabBar): show buffers in tabs


## License
Licensed under the MIT license. See the included LICENSE file.
