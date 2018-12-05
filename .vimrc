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


" all of your plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

set splitbelow
set splitright

nnoremap <c-j> <c-w><c-j>
nnoremap <c-k> <c-w><c-k>
nnoremap <c-l> <c-w><c-l>
nnoremap <c-h> <c-w><c-h>

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
"#######################################################

Plugin 'vim-scripts/indentpython.vim'

" au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

set encoding=utf-8

Bundle 'Valloric/YouCompleteMe'

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

Plugin 'vim-syntastic/syntastic'
Plugin 'nvie/vim-flake8'

let python_highlight_all=1
syntax on

Plugin 'jnurmine/Zenburn'
Plugin 'altercation/vim-colors-solarized'
if has('gui_running')
  set background=dark
  colorscheme solarized
else
  colorscheme zenburn
endif
"doesn't work anymore
"call togglebg#map("<F5>")

Plugin 'scrooloose/nerdtree'

Plugin 'jistr/vim-nerdtree-tabs'

set nu

Plugin 'tpope/vim-fugitive'

Plugin 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}

" to remove trailing whitespaces: run :StripWhitespace in vim
Plugin 'ntpeters/vim-better-whitespace'

" map the keys 'jk' to the Escape key to improve efficiency.
imap jk <Esc>

" show characters to target with f
Plugin 'unblevable/quick-scope'

" Comment with hotkeys
Plugin 'scrooloose/nerdcommenter'

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

" fuzzysearch
Plugin 'junegunn/fzf', { 'dir': '~/.fzf', 'do': 'yes \| ./install' }
" ctrl-p with FZF
map <C-p> :FZF~<CR>

" navigate between tmux and vim splits seemlessly
Plugin 'christoomey/vim-tmux-navigator'

" nmap Q :q!<CR>

" remap <C-I> for yanking or pasting to/from clipboard
noremap <C-I> "+

Plugin 'junegunn/rainbow_parentheses.vim'

" paste things with <C-c><C-c> to tmux, screen, Python, R, etc (<C-c><C-v> to select output programm)
Plugin 'jpalardy/vim-slime'
"configure slime
let g:slime_target = "tmux"

" rainbow par
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
