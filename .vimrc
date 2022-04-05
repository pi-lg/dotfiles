set nocompatible              " required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" Add all your plugins here (note older versions of Vundle used Bundle instead of Plugin)


Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'
" Plugin 'masukomi/vim-markdown-folding'
Plugin 'vim-scripts/indentpython.vim'
Plugin 'Valloric/YouCompleteMe'
Plugin 'vim-syntastic/syntastic'
Plugin 'nvie/vim-flake8'
Plugin 'jnurmine/Zenburn'
Plugin 'altercation/vim-colors-solarized'
Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'tpope/vim-fugitive'
Plugin 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}
" to remove trailing whitespaces: run :StripWhitespace in vim
Plugin 'ntpeters/vim-better-whitespace'
" show characters to target with f
Plugin 'unblevable/quick-scope'
" Comment with hotkeys
Plugin 'scrooloose/nerdcommenter'
" fuzzysearch
Plugin 'junegunn/fzf', { 'dir': '~/.fzf', 'do': 'yes \| ./install' }
" navigate between tmux and vim splits seemlessly
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'junegunn/rainbow_parentheses.vim'
" paste things with <C-c><C-c> to tmux, screen, Python, R, etc (<C-c><C-v> to select output programm)
Plugin 'jpalardy/vim-slime'

" Plugins to use vim as C++ ide
Plugin 'LucHermitte/lh-vim-lib'
Plugin 'LucHermitte/lh-style'
Plugin 'LucHermitte/lh-tags'
Plugin 'LucHermitte/lh-dev'
Plugin 'LucHermitte/lh-brackets'
Plugin 'LucHermitte/searchInRuntime'
Plugin 'LucHermitte/mu-template'
Plugin 'tomtom/stakeholders_vim'
Plugin 'LucHermitte/alternate-lite'
Plugin 'LucHermitte/lh-cpp'

" all of your plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

set splitbelow
set splitright

nnoremap <c-j> <c-w><c-j>
nnoremap <c-k> <c-w><c-k>
nnoremap <c-l> <c-w><c-l>
nnoremap <c-h> <c-w><c-h>

" lh-cpp remappings
nmap <c-n> <Plug>MarkersJumpF
nmap <A-l><S-Del> <Plug>MarkersJumpB
nmap <A-l>$ <Plug>MarkersCloseAllAndJumpToLast
nmap <A-L><End> <Plug>MarkersJumpOutside
nmap <A-L><Ins> <Plug>MarkersMark

" paste without yanking in visual mode
vnoremap p "_dP

" Enable folding
set foldmethod=indent
set foldlevel=99

" Enable folding with the spacebar
nnoremap <space> za

Plugin 'tmhedberg/SimpylFold'
let g:SimpylFold_docstring_preview=1

" tab settings #########################################
set tabstop=2
set shiftwidth=2

"au BufNewFile,BufRead *.py
autocmd FileType python
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4 |
    \ set textwidth=100 |
    \ set expandtab |
    \ set autoindent |
    \ set fileformat=unix

autocmd FileType sql
		\ set tabstop=2 |
		\ set softtabstop=2 |
		\ set shiftwidth=2 |
		\ set expandtab |
		\ set autoindent

autocmd FileType javascript
		\ set tabstop=2 |
		\ set softtabstop=2 |
		\ set shiftwidth=2 |
		\ set expandtab |
		\ set autoindent

" Markdown
autocmd BufNewFile,BufRead *.md set filetype=markdown
autocmd FileType markdown
		\ set autoindent |
		\ set noexpandtab |
		"\ set softtabstop=2 |
		"\ set shiftwidth=2 |
		\ set conceallevel=2 |
		\ set foldexpr=NestedMarkdownFolds()

let g:markdown_fenced_languages = ['sql', 'python', 'py=python', 'javascript', 'js=javascript', 'json', 'xml']


"#######################################################

" source ~/.vim/bundle/renumber/plugin/renumber.vim


" au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

set encoding=utf-8

" You complete me settings
let g:ycm_filetype_blacklist = {}
let g:ycm_autoclose_preview_window_after_completion=1
map <leader>d  :YcmCompleter GoToDefinitionElseDeclaration<CR>

"python with virtualenv support
"py << EOF
"import os
"import sys
"if 'VIRTUAL_ENV' in os.environ:
"  project_base_dir = os.environ['VIRTUAL_ENV']
"  activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
"  execfile(activate_this, dict(__file__=activate_this))
"EOF


" syntastic settings
let python_highlight_all=1
syntax on

" color setting for Zenburn and solarized
if has('gui_running')
  set background=dark
  colorscheme solarized
else
  colorscheme zenburn
endif
"doesn't work anymore
"call togglebg#map("<F5>")


" setting for Nerdtree?
set nu


" settings for powerline plugin
set  rtp+=/usr/local/lib/python2.7/dist-packages/powerline/bindings/vim/
set laststatus=2
set t_Co=256


" map the keys 'jk' to the Escape key to improve efficiency.
imap jk <Esc>

" settings for nerdcommenter:
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1
" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1
" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'
" Set a language to use its alternate delimiters by default
"let g:NERDAltDelims_java = 1
" Add your own custom formats or override the defaults
let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }
" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1
" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1
" toggle comment remap
nmap <C-_> <Plug>NERDCommenterToggle
vmap <C-_> <Plug>NERDCommenterToggle<CR>gv

" settings for fzf
" ctrl-p with FZF
map <C-p> :FZF~<CR>

" nmap Q :q!<CR>

" configure vim-slime
let g:slime_target = "tmux"

" settings for rainbow-parentheses
augroup rainbow_lisp
  autocmd!
  autocmd FileType lisp,clojure,scheme RainbowParentheses
augroup END
let g:rainbow#pairs = [['(', ')'], ['[', ']'], ['{', '}']]

" Show the cursor position
set ruler

" Show the (partial) command as it’s being typed
set showcmd

" Highlight current line
set cursorline

set nocompatible
if has("autocmd")
	filetype plugin indent on
endif

source ~/.vim/filetype.vim
