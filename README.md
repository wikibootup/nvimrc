# nvimrc

### Pre-requisites


- [NeoVim](https://github.com/neovim/neovim/)

- [Plug install](https://github.com/junegunn/vim-plug)
- Vim Color scheme is set although terminal editor set the specific configurations, because
  - 1. the colors of the status lines like SpellBad, SpellCap
  - 2. readibility, More darkened vim background color(XTERM 256) works me well.

- Symbolic link some configuration files for plugins
  - .tern-project
  - .ctags originally from [here](https://github.com/grassdog/dotfiles/blob/6bd36bcb59b57eac28d618f76f21e83d4fc487a8/ctags)

- Tern no module named ...
  - `npm install` at './nvim/plugged/tern_for_vim'
  - [Reference](https://vimeo.com/67215272)

- Neovim plugins
  - Tern no module named ...
    - `npm install` at './nvim/plugged/tern_for_vim'
    - [Reference](https://vimeo.com/67215272)
  - deoplete, not found completion?
    - compiled NeoVim python module was required, python2,3 in system path was applied for now.

Sources & References
---
https://github.com/dahlia/nvimrc
