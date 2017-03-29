# nvimrc

### Screenshot ( 02.21.2017 )

![20170221](https://cloud.githubusercontent.com/assets/6479173/23148236/c967b16a-f827-11e6-9a8d-bd248af6a0be.png)

### Pre-requisites


- [NeoVim](https://github.com/neovim/neovim/)

- [Plug install](https://github.com/junegunn/vim-plug)

- NOTE: Check plugins' performance before add a plugin
  - [link](http://stackoverflow.com/a/12216578)

- Vim Color scheme is set although terminal editor set the specific configurations, because
  - 1. The status line's color like SpellBad, SpellCap

- Symbolic link some configuration files for plugins
  - .tern-project

- Tern no module named ...
  - `npm install` at './nvim/plugged/tern_for_vim'
  - [Reference](https://vimeo.com/67215272)

- Neovim plugins
  - Tern no module named ...
    - `npm install` at './nvim/plugged/tern_for_vim'
    - [Reference](https://vimeo.com/67215272)
  - deoplete, not found completion?
    - compiled NeoVim python module was required, python2,3 in system path was applied for now.

- Colorscheme for matching terminal(iterm2) [Link](https://github.com/mbadolato/iTerm2-Color-Schemes)
  - Or, now I use 'dracula'. it makes vim faster than others(03/15/2017). [iterm](https://draculatheme.com/iterm/), [editor](https://github.com/dracula/dracula-theme/)

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
  - 14px(or bigger), medium
    - If 13px(or smaller) fonts makes editor slow (because many texts should be processed.)

Sources & References
---
https://github.com/dahlia/nvimrc
