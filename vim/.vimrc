set nocompatible            " enter the current millenium

" Search down into subfolders
" Provides tab-completion for all file-related tasks
set path+=**

syntax enable                   " Enable syntax highlighting.
colorscheme darcula
filetype plugin indent on   " Enable file type based indentation.

set autoindent              " Respect indentation when starting a new line.
set expandtab               " Expand tabs to spaces. Essential in Python.
set tabstop=4               " Number of spaces tab is counted for.
set shiftwidth=4            " Number of spaces to use for autoindent.

" Display relative line numbers, with absolute line number for current line
set number  " show line numbers
set numberwidth=5
set relativenumber
set tw=79   " width of document (used by gd)
set colorcolumn=80
highlight ColorColumn ctermbg=233


"vim-plug
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-repeat'
" ysiw[ to add [ braces in word ] cs[" to change surrounding from [] to ""
Plug 'tpope/vim-surround'
" gcc to comment line gcgc to toggle
Plug 'tpope/vim-commentary'
Plug 'vim-airline/vim-airline'
Plug 'takac/vim-hardtime' "Vim Hardtime
Plug 'ycm-core/YouCompleteMe'
" Try command-t or ctrlp
call plug#end()

" vim:ft=vim
