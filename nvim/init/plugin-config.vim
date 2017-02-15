"Plugin configuration ---------------------------------------------------------

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

"Vim colorscheme (it should be located after syntax on)

"When Solarized
"let g:solarized_termcolors=256
set background=dark
"colorscheme solarized
"Else if Monokai with Monokai soda terminal in iterm2
colorscheme monokai
set t_Co=256  " vim-monokai now only support 256 colours in terminal.

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

"Atags.vim
"Generate tags everytime a file is being written.
" generating tags when save makes system(vi speed) slow.
"autocmd BufWritePost * call atags#generate()
map <Leader>t :call atags#generate()<cr>

"End Plugin configuration -----------------------------------------------------
