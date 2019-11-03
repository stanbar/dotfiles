" Leader
let mapleader = " "

set nocompatible            " enter the current millenium

set nobackup
set nowritebackup
set noswapfile    " http://robots.thoughtbot.com/post/18739402579/global-gitignore#comment-458413287
set showcmd       " display incomplete commands
set autowrite     " Automatically :write before running commands
set modelines=0   " Disable modelines as a security precaution
set nomodeline

" Search down into subfolders
" Provides tab-completion for all file-related tasks
set path+=**

colorscheme darcula

set expandtab               " Expand tabs to spaces. Essential in Python.
set tabstop=2               " Number of spaces tab is counted for.
set shiftwidth=2            " Number of spaces to use for autoindent.
set shiftround

" Display relative line numbers, with absolute line number for current line
set number  " show line numbers
set numberwidth=5
set relativenumber
set textwidth=80   " width of document (used by gd)
set formatoptions-=t  " dont insert newline when you exceed 80 characters
set colorcolumn=+1

" Open new split panes to right and bottom, which feels more natural
set splitbelow
set splitright

" Always use vertical diffs
set diffopt+=vertical

set pastetoggle=<F3>

" Switch between the last two files
nnoremap <Leader><Leader> <C-^>

" Quicker window movement
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

" Map Ctrl + p to open fuzzy find (FZF)
nnoremap <c-p> :Files<cr>
nnoremap <leader>p :Ag<cr>
" Tmux suppoer 
autocmd VimResized * :wincmd =
nnoremap <leader>= :wincmd =<cr>
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
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'junegunn/fzf.vim'
Plug 'vim-airline/vim-airline'
Plug 'takac/vim-hardtime' "Vim Hardtime
Plug 'ycm-core/YouCompleteMe'
Plug 'editorconfig/editorconfig-vim'
Plug 'peitalin/vim-jsx-typescript'
Plug 'tpope/vim-fugitive'
Plug 'udalov/kotlin-vim'
Plug 'christoomey/vim-conflicted'
Plug 'christoomey/vim-tmux-navigator'
Plug 'christoomey/vim-tmux-runner'
" Try command-t or ctrlp
call plug#end()
" Required to vim work with fzf
set rtp+=~/.fzf
" set .tsx files as typescript filetypes
autocmd BufEnter *.tsx set filetype=typescript
" vim:ft=vim
