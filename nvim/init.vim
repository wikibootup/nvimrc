"No compatibility to traditional vi
set nocompatible

"vim-plug
call plug#begin('~/.config/nvim/plugged')

"Plugin list ------------------------------------------------------------------

Plug 'altercation/vim-colors-solarized'
Plug 'vim-scripts/Mustang2'
Plug 'Railscasts-Theme-GUIand256color'
Plug 'vim-scripts/darktango.vim'
Plug 'junegunn/seoul256.vim'
Plug 'vim-scripts/xoria256.vim'
Plug 'jdkanani/vim-material-theme'

Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'
Plug 'othree/html5.vim'
Plug 'lepture/vim-jinja'
Plug 'cakebaker/scss-syntax.vim'
Plug 'stephpy/vim-yaml'

Plug 'tpope/vim-surround'
Plug 'bling/vim-airline'
Plug 'scrooloose/syntastic'
Plug 'Shougo/unite.vim'
Plug 'Shougo/vimfiler.vim'
Plug 'simnalamburt/vim-mundo'
" Plug 'davidhalter/jedi-vim' " In virtuanenv, path not added, error
Plug 'rhysd/committia.vim'
function! DoRemote(arg)
  UpdateRemotePlugins
endfunction
Plug 'Shougo/deoplete.nvim', { 'do': function('DoRemote') }

Plug 'wakatime/vim-wakatime'

Plug 'scrooloose/nerdtree'
Plug 'ConradIrwin/vim-bracketed-paste'
Plug 'honza/vim-snippets'
Plug 'Valloric/YouCompleteMe'
Plug 'jiangmiao/auto-pairs'

" asynchronous execution library, needed for haskell ghc-mode
Plug 'Shougo/vimproc.vim', {'do' : 'make'}

" Haskell
Plug 'pbrisbin/vim-syntax-shakespeare'
Plug 'dag/vim2hs'
" haskell autocomplete
Plug 'eagletmt/neco-ghc'

" Javascript
Plug 'leafgarland/typescript-vim'
Plug 'pangloss/vim-javascript'
Plug 'moll/vim-node'
Plug 'groenewege/vim-less'
Plug 'Shutnik/jshint2.vim'
Plug 'ternjs/tern_for_vim'

" Templates
" jade
Plug 'digitaltoad/vim-pug'

Plug 'Quramy/vim-js-pretty-template'

"End plugin list --------------------------------------------------------------
call plug#end()

"Syntax highlighting.
syntax on

""" Error occured : Color configuration disabless the syntax on configuration.
" use iterm preferences to set color
" Use the Solarized Dark theme
" set background=dark
"colorscheme solarized
"let g:solarized_termtrans=1
"""

" Enable line numbers
" set number
" Highlight current line
set cursorline
"Softtab -- use spaces instead tabs.
set expandtab
set tabstop=2 shiftwidth=2 sts=2
set noautoindent nosmartindent

"set tab characters apart
set listchars=tab:↹\

"I dislike CRLF.
if !exists("vimpager")
  set fileformat=unix
endif

set backspace=2

"Detect modeline hints.
set modeline

"Disable bell
set visualbell t_vb=

"Prefer UTF-8.
set encoding=utf-8 fileencodings=ucs-bom,utf-8,cp949,korea,iso-2022-kr

"More tabs
set tabpagemax=25

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

"Syntastic-related configurations.
let g:syntastic_always_populate_loc_list = 0
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

"Markdown-related configurations.
augroup mkd
  autocmd BufRead *.markdown set formatoptions=tcroqn2 comments=n:> spell
  autocmd BufRead *.mkdn     set formatoptions=tcroqn2 comments=n:> spell
  autocmd BufRead *.mkd      set formatoptions=tcroqn2 comments=n:> spell
augroup END

"English spelling checker.
setlocal spelllang=en_us

"Keep 80 columns.
augroup collumnLimit
  set colorcolumn=80
  highlight OverLength ctermfg=white guibg=#592929
  match OverLength /\%81v.\+/
  autocmd WinEnter * match OverLength /\%81v.\+/
augroup END

"I dislike folding.
set nofoldenable

"I dislike visual bell as well.
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

"vim-airline
let g:airline_powerline_fonts = 1

"Mundo -- Undo tree visualization
set undofile
set undodir=~/.config/nvim/undo
nnoremap <F5> :MundoToggle

"Use Vimfiler as default explorer like netrw
let g:vimfiler_as_default_explorer = 1

" NerdTree
" To open a NERDTree automatically when vim starts up if no files were specified
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
" To close vim if only one window left
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" Shortcut [Ctrl]+n
map <C-n> :NERDTreeToggle<CR>

" Vim surround
" surround a word & insert surround text mode
map <C-w> ysiw

" Vim Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

let g:syntastic_loc_list_height = 3

let g:syntastic_javascript_checkers = ['jshint']
let g:syntastic_typescript_checkers = ['tslint']

nnoremap <C-S> : SyntasticToggleMode<CR>

" Quramy/vim-js-pretty-template
autocmd FileType javascript JsPreTmpl html

" Typescript-vim
let g:typescript_compiler_binary = 'tsc'
let g:typescript_compiler_options = ''
autocmd FileType typescript :set makeprg=tsc
autocmd QuickFixCmdPost [^l]* nested cwindow
autocmd QuickFixCmdPost    l* nested lwindow

" Tern
" Automatic hints after a delay
let g:tern_show_argument_hints='on_hold'
" Enable shortcuts 
let g:tern_map_keys=1

" i don't know where mouse=a is enabled, so disable it & enalble r for copy
" paste
set mouse-=a
set mouse=r
" vim mouse mode on
set mouse+=n

" VIM default Key map
" move to beginning of the current line
map <C-a> 0
"move to end of line
map <C-e> $
