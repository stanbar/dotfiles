call plug#begin()
" LSP
Plug 'neovim/nvim-lspconfig'
Plug 'nvim-lua/lsp_extensions.nvim'
Plug 'nvim-treesitter/nvim-treesitter' " improve syntax highlighting
Plug 'github/copilot.vim'

" MISC
Plug 'kyazdani42/nvim-web-devicons' " for file icons
Plug 'kyazdani42/nvim-tree.lua' " nvim tree

Plug 'machakann/vim-highlightedyank' " show what was yanked

" Fuzzy finders
Plug 'ctrlpvim/ctrlp.vim'
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

Plug 'tpope/vim-repeat' 

Plug 'christoomey/vim-tmux-navigator' " integration with tmux
Plug 'nvim-lua/completion-nvim' " Add auto competion
Plug 'tpope/vim-surround' " parentheses, brackets, quotes, XML tags
Plug 'tpope/vim-commentary' " add comments using gcc command 
Plug 'wakatime/vim-wakatime' " tracking
Plug 'jiangmiao/auto-pairs' " Automatic pairs
Plug 'editorconfig/editorconfig-vim'
Plug 'christoomey/vim-tmux-runner'
Plug 'bronson/vim-visual-star-search'

" Git
Plug 'christoomey/vim-conflicted'
Plug 'tpope/vim-fugitive' " A Git wrapper so awesome, it should be illegal

" APPEARENCE
Plug 'joshdick/onedark.vim'

call plug#end()
lua << EOF
lspconfig = require "lspconfig"
completion = require "completion"
treesitter = require "nvim-treesitter.configs"

require'nvim-tree'.setup()

-- Disable arrows
vim.api.nvim_set_keymap('', '<Up>', '<Nop>', { })  -- Disable arrow Up in Normal, Visual, Select, Operator-Pending
vim.api.nvim_set_keymap('i', '<Up>', '<Nop>', { }) -- Disable arrow Up in Insert

vim.api.nvim_set_keymap('', '<Down>', '<Nop>', { })  -- Disable arrow Down in Normal, Visual, Select, Operator-Pending
vim.api.nvim_set_keymap('i', '<Down>', '<Nop>', { }) -- Disable arrow Down in Insert

vim.api.nvim_set_keymap('', '<Left>', '<Nop>', { })  -- Disable arrow Left in Normal, Visual, Select, Operator-Pending
vim.api.nvim_set_keymap('i', '<Left>', '<Nop>', { }) -- Disable arrow Left in Insert

vim.api.nvim_set_keymap('', '<Right>', '<Nop>', { })  -- Disable arrow Right in Normal, Visual, Select, Operator-Pending
vim.api.nvim_set_keymap('i', '<Right>', '<Nop>', { }) -- Disable arrow Right in Insert


treesitter.setup {
  ensure_installed = "maintained",     
  highlight = {
    enable = true              
  },
}




local on_attach = function(client, bufnr)
  completion.on_attach()
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  local opts = { noremap=true, silent=true }
  buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
  buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  buf_set_keymap('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
  buf_set_keymap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  buf_set_keymap('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  buf_set_keymap('n', '<space>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
  buf_set_keymap('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
  buf_set_keymap('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
  buf_set_keymap('n', '<space>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)


  if vim.bo.filetype == "rust" then
    vim.api.nvim_exec([[
    autocmd BufEnter,BufWinEnter,TabEnter *.rs :lua require'lsp_extensions'.inlay_hints{ enabled = { "ChainingHint", "TypeHint", "ParameterHint"}, prefix = "  "}    
    ]], false)
  end

  -- Set some keybinds conditional on server capabilities
  if client.resolved_capabilities.document_formatting then
    buf_set_keymap("n", "<space>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
  elseif client.resolved_capabilities.document_range_formatting then
    buf_set_keymap("n", "<space>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
  end

  -- Set autocommands conditional on server_capabilities
  if client.resolved_capabilities.document_highlight then
    vim.api.nvim_exec([[
      hi LspReferenceRead cterm=bold ctermbg=red guibg=LightYellow
      hi LspReferenceText cterm=bold ctermbg=red guibg=LightYellow
      hi LspReferenceWrite cterm=bold ctermbg=red guibg=LightYellow
      augroup lsp_document_highlight
        autocmd!
        autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
        autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
      augroup END
    ]], false)
  end
end

-- Use a loop to conveniently call 'setup' on multiple servers and
-- map buffer local keybindings when the language server attaches
local servers = {  "elmls","gopls","clangd", "pyright", "rust_analyzer", "hls" }
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
  }
end

lspconfig["denols"].setup {
  on_attach = on_attach,
  init_options = {
    lint = true,
  },
}
lspconfig["tsserver"].setup {
  on_attach = on_attach,
  root_dir = lspconfig.util.root_pattern("package.json"),
  init_options = {
    lint = true,
  },
}

function goimports(timeoutms)
  local context = { source = { organizeImports = true } }
  vim.validate { context = { context, "t", true } }

  local params = vim.lsp.util.make_range_params()
  params.context = context

  local method = "textDocument/codeAction"
  local resp = vim.lsp.buf_request_sync(0, method, params, timeoutms)
  if resp and resp[1] then
    local result = resp[1].result
    if result and result[1] then
      local edit = result[1].edit
      vim.lsp.util.apply_workspace_edit(edit)
    end
  end

  vim.lsp.buf.formatting()
end

EOF

let mapleader = " "
let NERDTreeShowHidden=1

if has('nvim')
  set inccommand=nosplit
endif

" Fix to use system clipboard
set clipboard=unnamedplus

set showcmd       " display incomplete commands
set autowrite     " Automatically :write before running commands
set modelines=0   " Disable modelines as a security precaution
set nomodeline

set number  " show line numbers
set numberwidth=5
set relativenumber

set scrolloff=10 " Make it so there are always ten lines below my cursor

set nu rnu
set noswapfile
set autoindent
set expandtab               " Expand tabs to spaces. Essential in Python.
set tabstop=2               " Number of spaces tab is counted for.
set shiftwidth=2            " Number of spaces to use for autoindent.
set shiftround

" TextEdit might fail if hidden is not set.
set hidden

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup


" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Open new split panes to right and bottom, which feels more natural
set splitbelow
set splitright

" Always use vertical diffs
set diffopt+=vertical


" Set completeopt to have a better completion experience
set completeopt=menuone,noinsert,noselect

" Avoid showing message extra message when using completion
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

" set completeopt-=preview
autocmd FileType go setlocal omnifunc=v:lua.vim.lsp.omnifunc
autocmd BufWritePre *.go lua goimports(1000)


"Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
"If you're using tmux version 2.2 or later, you can remove the outermost $TMUX check and use tmux's 24-bit color support
"(see < http://sunaku.github.io/tmux-24bit-color.html#usage > for more information.)
if (empty($TMUX))
  if (has("nvim"))
    "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  "For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
  "Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
  " < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
  if (has("termguicolors"))
    set termguicolors
  endif
endif

" set theme
syntax enable
let g:onedark_termcolors = 256
let g:onedark_terminal_italics = 1
colorscheme onedark 

" Highlight all occurences of selected word *
autocmd vimenter * hi Normal guibg=NONE ctermbg=NONE

" Use <Tab> and <S-Tab> to navigate through popup menu
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" Move across multiline strings
noremap j gj
noremap k gk

cnoremap <expr> %% getcmdtype() == ':' ? expand('%:h').'/' : '%%'

" Switch between the last two files
nnoremap <Leader><Leader> <C-^>

" Ag
nnoremap <leader>p :Ag<cr>
" NerdTREE

" nnoremap <leader>f :NERDTreeFind<CR>
" map <C-n> :NERDTreeToggle<CR>

" netrw
let g:netrw_banner = 0 " remove banner
let g:netrw_liststyle = 3 " tree structure
let g:netrw_browse_split = 4 
let g:netrw_altv = 1
let g:netrw_winsize = 25

" Ctrlp
let g:ctrlp_working_path_mode = 'ra'
set wildignore+=*/node_modules/*,*/dist/*,*.so,*.swp,*.zip
nnoremap <silent> <C-f> :CtrlP<CR>
let g:ctrlp_cmd = 'CtrlPMRU'
let g:ctrlp_show_hidden = 1

nnoremap <C-n> :NvimTreeToggle<CR>
nnoremap <leader>r :NvimTreeRefresh<CR>
nnoremap <leader>n :NvimTreeFindFile<CR>


" Using lua functions
nnoremap <leader>ff <cmd>lua require('telescope.builtin').find_files()<cr>
nnoremap <leader>F <cmd>lua require('telescope.builtin').live_grep()<cr>
nnoremap <leader>fb <cmd>lua require('telescope.builtin').buffers()<cr>
nnoremap <leader>fh <cmd>lua require('telescope.builtin').help_tags()<cr>
