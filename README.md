# nvimrc

### Pre-requisites

- [NeoVim](https://github.com/neovim/neovim/)

- Symbolic link some configuration files for plugins
  - .tern-project

- Python (2.6+ or 3.3+) for YouCompleteMe
	- $ brew install vim --with-python3 --without-python
	- $ sudo pip3 install --upgrade neovim
	- issues
		- [YouCompleteme unavailable : no module named future](https://github.com/Valloric/YouCompleteMe/issues/2271)
        - YCM is useful, but complex. therefore some configurations may cause an error. Don't waste time for these kind of issues. I use this just as the default state from install.
    - Tern no module named ...
      - `npm install` at './nvim/plugged/tern_for_vim'
      - [Reference](https://vimeo.com/67215272)
Sources & References
---
https://github.com/dahlia/nvimrc
