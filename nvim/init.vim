" No compatible with the original VI(venerable old)
set nocompatible

"VIM-PLUG
call plug#begin('~/.config/nvim/plugged')

"Plugin list ------------------------------------------------------------------

"NOTE: Check plugins' performance before add
"http://stackoverflow.com/a/12216578

"-----------------------------------------------------------------------------
"Views
"-----------------------------------------------------------------------------
Plug 'itchyny/lightline.vim'
Plug 'altercation/vim-colors-solarized'

"-----------------------------------------------------------------------------
"Edit
"-----------------------------------------------------------------------------
Plug 'godlygeek/tabular'
Plug 'jiangmiao/auto-pairs'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'zchee/deoplete-jedi'
Plug 'neomake/neomake'
Plug 'mileszs/ack.vim'
Plug 'yegappan/mru'
Plug 'tpope/vim-fugitive'
Plug 'terryma/vim-multiple-cursors'
Plug 'tpope/vim-commentary'
Plug 'https://github.com/easymotion/vim-easymotion'

"-----------------------------------------------------------------------------
"Languages
"-----------------------------------------------------------------------------

"HTML
Plug 'othree/html5.vim'
Plug 'mattn/emmet-vim'
Plug 'Valloric/MatchTagAlways'

"CSS
Plug 'ap/vim-css-color'
Plug 'hail2u/vim-css3-syntax'

"JAVASCRIPT
Plug 'ternjs/tern_for_vim', { 'do': 'npm install' }
Plug 'carlitux/deoplete-ternjs', { 'do': 'npm install -g tern' }
Plug 'moll/vim-node'
Plug 'pangloss/vim-javascript'
Plug 'jelera/vim-javascript-syntax'
Plug 'othree/javascript-libraries-syntax.vim'
Plug 'othree/yajs.vim'
Plug 'othree/es.next.syntax.vim'
Plug 'heavenshell/vim-jsdoc'

Plug 'fatih/vim-go'

"-----------------------------------------------------------------------------
"Finders
"-----------------------------------------------------------------------------

Plug 'scrooloose/nerdtree'
Plug 'junegunn/fzf', { 'do': './install --all' }
Plug 'majutsushi/tagbar'

"-----------------------------------------------------------------------------
"Misc
"-----------------------------------------------------------------------------

Plug 'junegunn/goyo.vim'

"End plugin list --------------------------------------------------------------

call plug#end()

"Plugin configuration ---------------------------------------------------------

"CSS3-syntax
setlocal iskeyword+=-
augroup VimCSS3Syntax
  autocmd!

  autocmd FileType css setlocal iskeyword+=-
augroup END

"-----------------------------------------------------------------------------
"VIM-jsdoc
let g:jsdoc_access_descriptions = 2

"Input configuration
let g:jsdoc_input_description = 1
let g:jsdoc_allow_input_prompt = 1
let g:jsdoc_return_description = 1

let g:jsdoc_underscore_private = 1
let g:jsdoc_param_description_separator = ' - '
let g:jsdoc_custom_args_hook = {
\ 'callback\|cb': {
\   'type': '{Function}',
\   'description': 'Callback function'
\ },
\ '^[a-zA-Z]+[a-zA-Z0-9]*$': {
\   'type': '{good}',
\   'description': 'description here'
\ },
\   '^_\?is': {
\     'type': '{Boolean}'
\   },
\   'options$': {
\     'type': '{Object}'
\   },
\}

"------------------------------------------------------------------------------
"vim-javascript
let g:javascript_plugin_jsdoc = 1
let g:javascript_plugin_flow = 1

"------------------------------------------------------------------------------
"Tagbar
nmap tag :TagbarToggle<CR>
nmap tfd :TagbarSetFoldlevel
let g:tagbar_foldlevel = 2
let g:tagbar_sort = 0
let g:tagbar_singleclick = 1
let g:tagbar_iconchars = ['▸', '▾']
let g:tagbar_compact = 1

"Tagbar for javascript from https://github.com/hushicai/tagbar-javascript.vim
let g:tagbar_type_javascript = {
  \ 'ctagsbin'  : 'esctags',
  \ 'ctagsargs' : '--memory="' . '128M' . '" -f -',
  \ 'kinds'     : [
    \ 'a:PARM',
    \ 'v:VAR',
    \ 'p:PROP',
    \ 'c:context'
  \ ],
  \ 'sro'        : '::',
  \ 'kind2scope' : {
      \ 'c' : 'context',
  \ },
  \ 'scope2kind' : {
      \ 'context'  : 'c'
  \ }
  \ }

let g:tagbar_type_vim = {
            \ 'ctagstype' : 'vim',
            \ 'kinds' : [
            \ 't:BLOCK',
            \ 'v:VAR:1:0',
            \ 'f:FUNC:1:0',
            \ 'a:AUTOCMD',
            \ 'c:COMMAND',
            \ 'm:MAP',
            \ ],
            \ }

let g:tagbar_type_sh = {
            \ 'ctagstype' : 'sh',
            \ 'kinds' : [
            \ 'v:VAR',
            \ 'f:FUNC:1:0',
            \ 'a:ALIAS',
            \ ]
            \ }

"------------------------------------------------------------------------------
"Lightline
let g:lightline = {
      \ 'colorscheme': 'seoul256',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'fugitive', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component': {
      \   'readonly': '%{&filetype=="help"?"":&readonly?"RO":""}',
      \   'modified': '%{&filetype=="help"?"":&modified?"+":&modifiable?"":"-"}',
      \   'fugitive': '%{exists("*fugitive#head")?fugitive#head():""}'
      \ },
      \ 'component_visible_condition': {
      \   'readonly': '(&filetype!="help"&& &readonly)',
      \   'modified': '(&filetype!="help"&&(&modified||!&modifiable))',
      \   'fugitive': '(exists("*fugitive#head") && ""!=fugitive#head())'
      \ },
      \ }

"MRU
let MRU_Max_Entries = 30
let MRU_Window_Height = 5
let MRU_Auto_Close = 0

"NerdTree
let NERDTreeMapActivateNode = '<tab>'
let NERDTreeMouseMode = 2

"Typescript-vim
let g:typescript_compiler_binary = 'tsc'
let g:typescript_compiler_options = ''
augroup TypescriptForVim
  autocmd!
  autocmd FileType typescript :set makeprg=tsc
  autocmd QuickFixCmdPost [^l]* nested cwindow
  autocmd QuickFixCmdPost    l* nested lwindow
augroup END

"deoplete.vim
let g:python_host_prog = '/Library/Frameworks/Python.framework/Versions/2.7/bin/python'
let g:python3_host_prog = '/Library/Frameworks/Python.framework/Versions/3.5/bin/python3'
let g:deoplete#max_list = 30
let g:deoplete#max_abbr_width = 50
let g:deoplete#enable_at_startup = 1
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"

"omnifuncs for deoplete
augroup omnifuncs
  autocmd!
  autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
  "NOTE: [Time killer issue] I unset html,markdown omnifunc expliciltly.
  "Because,
  "1. set=ommnifunc=htmlcomplete#CompleteTags now makes too many suggestions.
  "2. It ignores deoplete configuration.
  "3. It also has a problem with HTML5
  "Although I unset this configuration, auto-suggestion works normally.
  autocmd FileType html,markdown setlocal omnifunc=
  autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
  autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
  autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
augroup end

" tern
if exists('g:plugs["tern_for_vim"]')
  let g:tern_show_argument_hints = 'on_hold'
  let g:tern_show_signature_in_pum = 1

  augroup ExistTernForVim
    autocmd!
    autocmd FileType javascript setlocal omnifunc=tern#Complete
  augroup END
endif

"deoplete-ternjs
let g:tern_request_timeout = 1
let g:tern_show_signature_in_pum = '0'  " This do disable full signature type on autocomplete
" Use tern_for_vim.
let g:tern#command = ["tern"]
let g:tern#arguments = ["--persistent"]

let g:deoplete#omni#functions = {}
let g:deoplete#omni#functions.javascript = [
  \ 'tern#Complete',
  \ 'jspc#omni'
\]

"Neomake
"neomake makes work process slow bacase it causes a delay whenever the current buffer is saved
"use ':lopen' instead.
"https://github.com/neomake/neomake#file-makers
let g:neomake_open_list = 0
let g:neomake_list_height = 5
let g:neomake_javascript_jshint_maker = {
    \ 'args': ['--verbose'],
    \ 'errorformat': '%A%f: line %l\, col %v\, %m \(%t%*\d\)',
    \ }
let g:neomake_javascript_enabled_makers = ['jshint']
augroup Neomake
  autocmd!
  autocmd BufWritePost * Neomake
augroup END

"othree/javascript-libraries-syntax.vim
let libs = 'jquery,underscore,backbone,angularjs,d3,requirejs,angularui'
let g:used_javascript_libs = libs
augroup JavascriptLibrariesSyntax
  autocmd!
  autocmd BufReadPre *.js let b:javascript_lib_use_angularjs = 1
augroup END

"Unset html linter(tidy) because it makes too slow when save
let g:neomake_html_enabled_makers = []

"RipGrep integration
"http://www.wezm.net/technical/2016/09/ripgrep-with-vim/
if executable("rg")
  let g:ackprg = 'rg --vimgrep --no-heading -i'
endif

"End Plugin configuration -----------------------------------------------------

"View & Highlighters-----------------------------------------------------------

set background=dark
colorscheme solarized
"Set term color palette to 256, and auto
let g:solarized_termcolors = 256
"Set the default color with the best option for ITERM2 expliciltly.
let g:solarized_termtrans = 1

"End View & Highlighters  -----------------------------------------------------

"VIM configuration ------------------------------------------------------------

"Must be set first before configurations
filetype plugin indent on
syntax enable

"Enable line numbers
set number
"Softtab -- use spaces instead tabs.
set expandtab
set tabstop=2 shiftwidth=2 sts=2

"locate the new pane at the right when split
set splitright

"I dislike CRLF.
if !exists("vimpager")
  set fileformat=unix
endif

set backspace=2

"Case insensitve in cmdline
"NOTE: Must be set for other insensitve configurations
set ignorecase
"Case sensitive when search & replace
set smartcase
"Case insensitive when cmdline tab autocompletion
set infercase

"Disable to showing the completion preview pane
set completeopt-=preview

"Prefer UTF-8.
set encoding=utf-8 fileencodings=ucs-bom,utf-8,cp949,korea,iso-2022-kr

"Some additional syntax highlighters.
au! BufRead,BufNewFile *.wsgi setfiletype python
au! BufRead,BufNewFile *.sass setfiletype sass
au! BufRead,BufNewFile *.scss setfiletype scss
au! BufRead,BufNewFile *.haml setfiletype haml
au! BufRead,BufNewFile *.less setfiletype less

"These languages have their own tab/indent settings.
augroup IndentLanguages
  au!
  au FileType py    setl ts=4 sw=4 sts=4
  au FileType cpp    setl ts=4 sw=4 sts=4
  au FileType ruby   setl ts=2 sw=2 sts=2
  au FileType yaml   setl ts=2 sw=2 sts=2
  au FileType html   setl ts=2 sw=2 sts=2
  au FileType jinja  setl ts=2 sw=2 sts=2
  au FileType lua    setl ts=2 sw=2 sts=2
  au FileType haml   setl ts=2 sw=2 sts=2
  au FileType sass   setl ts=2 sw=2 sts=2
  au FileType scss   setl ts=2 sw=2 sts=2
  au FileType make   setl ts=4 sw=4 sts=4 noet
  au FileType markdown   setl ts=2 sw=2 sts=2
  au FileType gitcommit setl spell
augroup END

"English spelling checker.
setlocal spelllang=en_us

set novisualbell

"mouse mode enabled automatically (somewhere), but I set it expliciltly.
set mouse+=a

"Using the clipboard as the default register
"http://vim.wikia.com/wiki/Accessing_the_system_clipboard
"Commented. See 'doc/utility.txt'
"set clipboard=unnamedplus

"To show space(trail) as ~
set listchars=trail:~,tab:↹\
set list

"Folding
set foldmethod=indent
set foldlevel=99

"Just search word, not jump.
"http://stackoverflow.com/questions/4256697/vim-search-and-highlight-but-do-not-jump
nnoremap * :keepjumps normal! mi*`i<CR>

"Allows hiding buffers even though they contain modifications
"Issue with neovim & vim-airline : https://github.com/neovim/neovim/issues/4524
"http://www.guckes.net/vim/setup.html
set hid

"Speed up Syntax Highlighting
set nocursorcolumn
set nocursorline
"set lazyredraw "It makes no effect(or more slow?!) from personal experience
set ttyfast
set norelativenumber
set synmaxcol=400 "set enough(but not too long) column length.
syn sync minlines=50 maxlines=50

"End VIM configuration --------------------------------------------------------

"Key bindings -----------------------------------------------------------------

"Terminal in Vim
":help terminal-emulator-input
"Exit terminal mode
:tnoremap <Esc> <C-\><C-n>

"Quit file
nmap <C-q> :q<CR>
"Save file like GUI editor
nmap <C-s> :w<CR>

"Nerdtree
let NERDTreeMapOpenVSplit="<C-v>"
let NERDTreeMapOpenSplit="<C-s>"

"FZF
nmap fz :FZF <cr>
"fzf key map to be equal with NerdTree
let g:fzf_action = {
  \ 'ctrl-s': 'split',
  \ 'ctrl-v': 'vsplit'
  \ }

"Tern for js, auto key map not working now
"augroup TernForJs
"  autocmd!
"  autocmd FileType javascript nnoremap <silent> <buffer> td :TernDef<CR>
"augroup END

"Remove all trailing whitespace
nmap CTRAIL :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar><CR>
"Remove all tab space
nmap CTAB :%s/\t/  /g<CR>

"Folding
"fold (ex: level=<input><CR>)
nmap fd :setlocal foldlevel=
"Toggle
nmap <Tab> zO
nmap <s-Tab> zc

"Ack.vim
"type Ack, then it makes Ack!, because [I don't want to jump to the first result automatically.]
"https://github.com/mileszs/ack.vim#i-dont-want-to-jump-to-the-first-result-automatically
cnoreabbrev Ack Ack!
nnoremap <Leader>a :Ack!<Space>
map <S-f> :Ack \
map <C-f> :LAckWindow! -H \

"http://vim.wikia.com/wiki/Switch_between_Vim_window_splits_easily
nmap <S-Up> :wincmd k<CR>
nmap <S-Down> :wincmd j<CR>
nmap <S-Left> :wincmd h<CR>
nmap <S-Right> :wincmd l<CR>

"http://vim.wikia.com/wiki/Quick_yank_and_paste
"Ctrl + (c,x,v) as copy(yank)
vmap <C-c> y<Esc>i
vmap <C-x> d<Esc>i
imap <C-v> <Esc>pi

"-----------------------------------------------------------------------------
"Tabular
"jsdoc to align same column positions
vmap <leader>{ :Tabularize/ {/l0<CR>:Tabularize/}\zs<CR>:Tabularize/-<CR>
"-----------------------------------------------------------------------------

"New terminal in the top of the active pane
nmap term :new<CR>:wincmd k<CR>:resize 5<CR>:terminal<CR>

"New vertical pane at the side of the window (Condition: "splitright" is set.)
nmap side :vnew<CR>:vertical resize 40<CR>:wincmd h<CR>

"End Key bindings -------------------------------------------------------------

"VimEnter configurations ------------------------------------------------------
"NOTE: Order is important in this block.

augroup MRUOpen
  autocmd!
  autocmd VimEnter * MRU
augroup END

augroup NERDTreeOpen
  autocmd!
  "NERDTree
  autocmd VimEnter * NERDTree
  "To focus edit pane after NERDTree open
  autocmd VimEnter * wincmd l
augroup END

"Make a new 'Vertical New Pane Side' & back to the main pane
augroup SideRightOpen
  au!
  autocmd VimEnter * :vnew
  autocmd VimEnter * :vertical resize 40
  autocmd VimEnter * :wincmd h
augroup END

"END VimEnter configuration ---------------------------------------------------

"-----------------------------------------------------------------------------
"Last configuration(including Plugins)
" - to solve the order dependency
"-----------------------------------------------------------------------------

"MatchTagAlways
let g:mta_set_default_matchtag_color = 0
let g:mta_use_matchparen_group = 0
highlight MatchTag ctermfg=white ctermbg=black

"-----------------------------------------------------------------------------
"END Last configuration(including Plugins)
"-----------------------------------------------------------------------------
