"Key bindings -----------------------------------------------------------------

"Move to beginning of the current line
map <C-a> 0
"Move to end of line
map <C-e> $

"Quit file
nmap <C-q> :q<CR>
"Save file like GUI editor
nmap <C-s> :w<CR>

"Nerdtree
nmap q :NERDTreeToggle<cr>
let NERDTreeMapOpenVSplit="<C-v>"
let NERDTreeMapOpenSplit="<C-s>"

"Vim surround
"surround a word & insert surround text mode
nmap s ysiw

"FZF
nmap fz :FZF <cr>
"fzf key map to be equal with NerdTree
let g:fzf_action = {
      \ 'ctrl-s': 'split',
      \ 'ctrl-v': 'vsplit'
      \ }

"Tern for js, auto key map not working now
autocmd FileType javascript nnoremap <silent> <buffer> td :TernDef<CR>

"Remove all trailing whitespace
nmap Rtrailing :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar><CR>
"Remove all tab space
nmap Rtab :%s/\t/  /g
"Remove all tab space and trailing
nmap RT RtrailingRtab<CR>

" No highlight in search result
nmap nh :nohlsearch<CR>

"Atags.vim
"Generate tags everytime a file is being written.
" generating tags when save makes system(vi speed) slow.
"autocmd BufWritePost * call atags#generate()
nmap gT :call atags#generate()<CR>

"Folding
"fold (ex: level=<input><CR>)
nmap fd :setlocal foldlevel=
"Toggle
nmap <Tab> za

"Ack.vim
"type Ack, then it makes Ack!, because [I don't want to jump to the first result automatically.]
"https://github.com/mileszs/ack.vim#i-dont-want-to-jump-to-the-first-result-automatically
cnoreabbrev Ack Ack!
nnoremap <Leader>a :Ack!<Space>
map <S-f> :Ack 
map <C-f> :LAckWindow! -H 
let g:ack_mappings = {
  \ "<C-v>": "<C-W><CR><C-W>H<C-W>b<C-W>J<C-W>t",
  \ "<C-s>": "<C-W><CR><C-W>K" }

"http://vim.wikia.com/wiki/Switch_between_Vim_window_splits_easily
nmap <S-Up> :wincmd k<CR>
nmap <S-Down> :wincmd j<CR>
nmap <S-Left> :wincmd h<CR>
nmap <S-Right> :wincmd l<CR>

"MRU
nmap ru :MRU<CR>

"Yankring
nmap yr :YRShow<CR>

"End Key bindings -------------------------------------------------------------
