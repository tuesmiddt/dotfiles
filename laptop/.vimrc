set encoding=utf-8

set nocompatible
filetype off

"Init Vundle
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#rc('~/.vim/bundle/')

" Vundle Plugins
Plugin 'VundleVim/Vundle.vim'
Plugin 'arcticicestudio/nord-vim'
Plugin 'git://github.com/ctrlpvim/ctrlp.vim.git'
Plugin 'fatih/vim-go'
Plugin 'jiangmiao/auto-pairs'
Plugin 'tpope/vim-sensible'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'tpope/vim-fugitive'
Plugin 'airblade/vim-gitgutter'
Plugin 'scrooloose/syntastic'
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
Plugin 'garbas/vim-snipmate'
Plugin 'honza/vim-snippets.git'
Plugin 'L9'
Plugin 'othree/vim-autocomplpop'
Plugin 'wesQ3/vim-windowswap'
Plugin 'scrooloose/nerdtree'
"End Vundle Plugins

call vundle#end()

"" vim-airline
let g:airline_powerline_fonts = 1

"" SYNTASTIC - Syntax Checker
" These defaults are from Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_loc_list_height = 3
let g:syntastic_mode_map = {
	\ "mode": "passive",
	\ "active_filetypes": [],
	\ "passive_filetypes": [] }
" Map Ctrl+C to check syntax and Ctrl+Alt+C to remove syntax checker
nnoremap <C-c> :SyntasticCheck<CR>
nnoremap <C-A-c> :SyntasticReset<CR>

" Syntastic Checkers
let g:syntastic_python_checkers = ['flake8']
let g:syntastic_ruby_checkers = ['rubocop']
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_haml_checkers = ['haml_lint']
let g:syntastic_scss_checkers = ['scss_lint']
let g:syntastic_swift_checkers = ['swiftpm', 'swiftlint']

"" NERDTREE - file browser in sidebar
" Enter NERDTree on start if no argument
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
" Close if the only window left is NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" Ignore pyc files
let NERDTreeIgnore = ['\.pyc$']
" Toggle NERDTree with Ctrl+N
map <C-n> :NERDTreeToggle<CR>

filetype plugin indent on

"Colors
syntax enable
set background=dark
colorscheme nord

"Ruler
set colorcolumn=100
highlight ColorColumn ctermbg=0 guibg=lightgrey

"Spaces and Tabs
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab
set backspace=2

set hlsearch

" Set undo files and backup files in ~/.vimtmp
set undofile backup
set backupdir=~/.vimtmp,.
set directory=~/.vimtmp,.
set undodir=~/.vimtmp,.

"UI
set number
set showcmd
filetype indent on
set showmatch
set hls
set cursorline

"Folding
set foldenable
set foldlevelstart=10
set foldmethod=indent

"Key Mappings
nnoremap j gj
nnoremap k gk
" Map Ctrl+H to :noh (:nohlsearch)
nnoremap <C-h> :noh<CR>

let mapleader=","

" Java: got this from StackOverflow, set make to javac
autocmd Filetype java set makeprg=javac\ %:S
set errorformat=%A%f:%l:\ %m,%-Z%p^,%-C%.%#

" Trim trailing whitespace
autocmd FileType ruby autocmd BufWritePre * %s/\s\+$//e
