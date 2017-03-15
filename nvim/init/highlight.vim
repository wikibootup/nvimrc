"Highlighters-------------------------------------------------------------
"Vim colorscheme (it should be located after syntax on)
"set background=dark
color dracula

"Neomake
"highlight first letter in error line
augroup my_neomake_highlights
    au!
    autocmd ColorScheme *
      \ hi NeomakeError ctermbg=Red |
      \ hi NeomakeWarning ctermbg=DarkYellow
augroup END

"End Highlighters  -------------------------------------------------------------
