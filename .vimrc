set encoding=utf-8

set nocompatible
filetype off

"Init Vundle
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin('~/.vim/bundle/')

" Vundle Plugins
Plugin 'VundleVim/Vundle.vim'
Plugin 'git://github.com/altercation/vim-colors-solarized.git'
Plugin 'git://github.com/ctrlpvim/ctrlp.vim.git'
Plugin 'fatih/vim-go'

"End Vundle Plugins

call vundle#end()
filetype plugin indent on

"Colors
syntax enable
set background=dark
colorscheme solarized

"Spaces and Tabs
set tabstop=4
set softtabstop=4
set expandtab

"UI
set number
set showcmd
filetype indent on
set showmatch

"Folding
set foldenable
set foldlevelstart=10
set foldmethod=indent

"Key Mappings
nnoremap j gj
nnoremap k gk
nnoremap ; :
vnoremap ; :

let mapleader=","
