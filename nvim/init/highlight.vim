"Highlighters-------------------------------------------------------------
"Vim colorscheme (it should be located after syntax on)
set background=dark
colorscheme monokai

"Neomake
"highlight first letter in error line
augroup my_neomake_highlights
    au!
    autocmd ColorScheme *
      \ hi NeomakeError ctermbg=Red |
      \ hi NeomakeWarning ctermbg=DarkYellow
augroup END

"Vim monokai
augroup monokai_custom_highlights
    au!
    autocmd ColorScheme *
      \ hi Visual ctermfg=white ctermbg=DarkGrey
augroup END

"End Highlighters  -------------------------------------------------------------
