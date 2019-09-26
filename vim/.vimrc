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

" Open new split panes to right and bottom, which feels more natural
set splitbelow
set splitright

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
if executable('fzf')
    Plug '/usr/bin/fzf'
else
    Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
endif
Plug 'junegunn/fzf.vim'
Plug 'vim-airline/vim-airline'
Plug 'takac/vim-hardtime' "Vim Hardtime
Plug 'ycm-core/YouCompleteMe'
Plug 'editorconfig/editorconfig-vim'
Plug 'peitalin/vim-jsx-typescript'
Plug 'tpope/vim-fugitive'
Plug 'udalov/kotlin-vim'
Plug 'christoomey/vim-conflicted'
" Try command-t or ctrlp
call plug#end()
"
" set .tsx files as typescript filetypes
autocmd BufEnter *.tsx set filetype=typescript
" vim:ft=vim
