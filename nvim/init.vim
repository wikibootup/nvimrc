" No compatible with the original VI(venerable old)
set nocompatible

"VIM-PLUG
call plug#begin('~/.config/nvim/plugged')
 
"Plugin list ------------------------------------------------------------------

"Views
Plug 'altercation/vim-colors-solarized'
Plug 'bling/vim-airline'
Plug 'vim-airline/vim-airline-themes'

"Utils
Plug 'wakatime/vim-wakatime'

"Edit
Plug 'godlygeek/tabular'
Plug 'tpope/vim-surround'
Plug 'jiangmiao/auto-pairs'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'zchee/deoplete-jedi'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'ConradIrwin/vim-bracketed-paste'
Plug 'ervandew/supertab'
Plug 'neomake/neomake'

"Languages
Plug 'plasticboy/vim-markdown'
Plug 'ap/vim-css-color'
Plug 'leafgarland/typescript-vim'
Plug 'pangloss/vim-javascript'
Plug 'moll/vim-node'
Plug 'groenewege/vim-less'
Plug 'plasticboy/vim-markdown'
Plug 'cakebaker/scss-syntax.vim'
Plug 'carlitux/deoplete-ternjs', { 'do': 'npm install -g tern' }
Plug 'ternjs/tern_for_vim', { 'do': 'npm install' }

"Finders
Plug 'scrooloose/nerdtree'
Plug 'junegunn/fzf', { 'do': './install --all' }

"End plugin list --------------------------------------------------------------
call plug#end()

"VIM configuration ------------------------------------------------------------

"Must be set first before configurations
filetype plugin indent on
syntax enable

"Enable line numbers
set number
"Highlight current line
set cursorline
"Softtab -- use spaces instead tabs.
set expandtab
set tabstop=2 shiftwidth=2 sts=2

"I dislike CRLF.
if !exists("vimpager")
  set fileformat=unix
endif

set backspace=2

"Prefer UTF-8.
set encoding=utf-8 fileencodings=ucs-bom,utf-8,cp949,korea,iso-2022-kr

"Some additional syntax highlighters.
au! BufRead,BufNewFile *.wsgi setfiletype python
au! BufRead,BufNewFile *.sass setfiletype sass
au! BufRead,BufNewFile *.scss setfiletype scss
au! BufRead,BufNewFile *.haml setfiletype haml
au! BufRead,BufNewFile *.less setfiletype less

"These languages have their own tab/indent settings.
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
"Enable line numbers
set number
"Highlight current line
set cursorline
"Softtab -- use spaces instead tabs.
set expandtab
set tabstop=2 shiftwidth=2 sts=2

"I dislike CRLF.
if !exists("vimpager")
  set fileformat=unix
endif

set backspace=2

"Prefer UTF-8.
set encoding=utf-8 fileencodings=ucs-bom,utf-8,cp949,korea,iso-2022-kr


filetype plugin on

"Some additional syntax highlighters.
au! BufRead,BufNewFile *.wsgi setfiletype python
au! BufRead,BufNewFile *.sass setfiletype sass
au! BufRead,BufNewFile *.scss setfiletype scss
au! BufRead,BufNewFile *.haml setfiletype haml
au! BufRead,BufNewFile *.less setfiletype less

"These languages have their own tab/indent settings.
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
au FileType gitcommit setl spell

"English spelling checker.
setlocal spelllang=en_us

set novisualbell

"gVim-specific configurations (including MacVim).
if has("gui_running")
  set bg=dark
  colorscheme material-theme
  set guioptions=egmrLt
  set linespace=1
endif

"MacVim-specific configurations.
if has("gui_macvim") || has("gui_vimr")
  set imd
  set guifont=Source_Code_Pro_Light:h16.00
endif

"GVim under GNOME
if has("gui_gnome")
  set guifont="Ubuntu Mono 11"
endif

"GVim under Windows
if has("gui_win32")
  set guifont=Consolas:h11:cANSI
endif

"mouse mode enabled automatically (somewhere), but I set it expliciltly.
set mouse+=a

"Using the clipboard as the default register
"in vim 7.3.74 and higher you can set
"http://vim.wikia.com/wiki/Accessing_the_system_clipboard
set clipboard=unnamedplus

"To show space(trail) as ~
set listchars=trail:~,tab:↹\
set list

"diable folding
set nofoldenable

"Hightlight for comment as gray
hi Comment ctermfg=gray

"Disable automatic comment insertion
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

"End VIM configuration --------------------------------------------------------

"Plugin configuration ---------------------------------------------------------

"""YCM
""let g:ycm_seed_identifiers_with_syntax = 1

"Vim-airline
let g:airline_powerline_fonts = 1

"Vim-airline-themes
let g:airline_theme='luna'

"NerdTree
"To close vim if only one window left
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
let NERDTreeMapActivateNode='<tab>'

"Typescript-vim
let g:typescript_compiler_binary = 'tsc'
let g:typescript_compiler_options = ''
autocmd FileType typescript :set makeprg=tsc
autocmd QuickFixCmdPost [^l]* nested cwindow
autocmd QuickFixCmdPost    l* nested lwindow

"Vim solarized (it should be located after syntax on)
let g:solarized_termcolors=256
set background=dark
colorscheme solarized

"deoplete.vim
let g:python_host_prog = '/Library/Frameworks/Python.framework/Versions/2.7/bin/python'
let g:python3_host_prog = '/Library/Frameworks/Python.framework/Versions/3.5/bin/python3'
let g:deoplete#enable_at_startup = 1
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"

"omnifuncs for deoplete
augroup omnifuncs
  autocmd!
  autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
  autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
  autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
  autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
  autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
augroup end

" tern
if exists('g:plugs["tern_for_vim"]')
  let g:tern_show_argument_hints = 'on_hold'
  let g:tern_show_signature_in_pum = 1

  autocmd FileType javascript setlocal omnifunc=tern#Complete
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
let g:neomake_javascript_jshint_maker = {
    \ 'args': ['--verbose'],
    \ 'errorformat': '%A%f: line %l\, col %v\, %m \(%t%*\d\)',
    \ }
let g:neomake_javascript_enabled_makers = ['jshint']
autocmd! BufWritePost * Neomake

"End Plugin configuration -----------------------------------------------------

"Key bindings -----------------------------------------------------------------

"Move to beginning of the current line
map <C-a> 0
"Move to end of line
map <C-e> $

"Nerdtree
nmap q :NERDTreeToggle<cr>

"Vim surround
"surround a word & insert surround text mode
nmap s ysiw

"FZF
nmap fzf :FZF <ENTER>

"Tern for js, auto key map not working now
autocmd FileType javascript nnoremap <silent> <buffer> td :TernDef<CR>

"End Key bindings -------------------------------------------------------------
