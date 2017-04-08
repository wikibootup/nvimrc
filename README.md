# nvimrc

## Philosophy

1. Use VIM as **simple** and **useful** as possible.

- Keep it as one file (No import runtime).
- No add Plugins which makes vim slow.
- Add Autocmds only if necessary.

2. Package manager priority
  - VIM(plug) >= OS(brew) > NODE(npm)

## Pre-requisites

- [NeoVim](https://github.com/neovim/neovim/)

- [Plug install](https://github.com/junegunn/vim-plug)

- NOTE: Check plugins' performance before add a plugin
  - [link](http://stackoverflow.com/a/12216578)

- Symbolic link some configuration files for plugins
  - .tern-project

- Neovim plugins
  - Tern no module named ...
    - `npm install` at './nvim/plugged/tern_for_vim'
    - [Reference](https://vimeo.com/67215272)
  - deoplete, not found completion?
    - compiled NeoVim python module was required, python2,3 in system path was applied for now.
  - Vim-javascript
    - Install '[jsdoc](http://usejsdoc.org/)', '[flow](https://flow.org/)'
      - `$ npm install -g jsdoc`
      - `$ brew install flow`
  - Tagbar-javascript
    - I've tried to find many ways to make tagbar for JS, then I selected it.
    - `$ npm install -g esctags`

- Colorscheme for matching terminal(iterm2)
  - I use iterm Colorscheme and vim colorscheme both (To match syntax highlight in vim).
  - There are many colorschemes, like tomorrow, dracula, molokai, etc.
    - But finally I've comeback to use the solarized dark (just my taste).

- Search apps
  - [fzf](https://github.com/junegunn/fzf)
    - binded `:FZF` as `fz`
    - it is intergrated with [zshrc](github.com/wikibootup/zshrc) configurations
  - [Ack.vim](https://github.com/mileszs/ack.vim)
    - `$ brew install ack` for mac. [link](https://github.com/mileszs/ack.vim/issues/156#issuecomment-218553117)
    - Add `'mileszs/ack.vim'` into 'plugin list'
    - integrated with ['ripGrep'](https://github.com/BurntSushi/ripgrep)
      - `$ brew install ripgrep`
      - [link](http://www.wezm.net/technical/2016/09/ripgrep-with-vim/)

- Font
  - [Inconsolata for Powerline](https://github.com/powerline/fonts)
  - Both Ascii & Non Ascii
  - 14px(or bigger), Bold
    - If 13px(or smaller) fonts makes editor slow (because many texts should be processed.)

Sources & References
---
https://github.com/dahlia/nvimrc
