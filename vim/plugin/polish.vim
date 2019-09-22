" Enable Polish words
set fileencodings=ucs-bom,utf-8,default,latin1
set encoding=utf-8
setglobal fileencoding=utf-8 bomb

" Set Polish language spelling correction
if v:version >= 700
    " Toggle in-line spell checking on and off with `,s`
    let mapleader = ","
    nmap <silent> <leader>s :set spell!<CR>
    "Set region to British English
    "set spelllang=en_gb
    set spelllang=pl,en_us,en_gb
endif

