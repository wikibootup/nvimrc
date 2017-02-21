" No compatible with the original VI(venerable old)
set nocompatible

"VIM-PLUG
call plug#begin('~/.config/nvim/plugged')
runtime! init/plugin-list.vim
"End plugin list --------------------------------------------------------------
call plug#end()

"To set source order, each files to be sourced is specified rather than using
"**/*.vim
runtime! init/plugin-config.vim
runtime! init/highlight.vim
runtime! init/vim-config.vim
runtime! init/key-binding.vim
