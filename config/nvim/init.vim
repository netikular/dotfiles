
set exrc
set guicursor=
set relativenumber
set nu
set nohlsearch
set hidden
set noerrorbells
set tabstop=2 softtabstop=2
set shiftwidth=2
set expandtab
set smartindent
set nowrap
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
set undolevels=5000
set incsearch
set scrolloff=8
set noshowmode
set completeopt=menuone,noinsert,noselect
set signcolumn=yes
set colorcolumn=80

set updatetime=50
set shortmess+=c
set cmdheight=2

set cursorline
set termguicolors
set background=dark
set clipboard=unnamed


set winwidth=84
set winheight=10
set winminheight=10
set winheight=9999

" set backup
" set backupdir=~/.vim-tmp
" set directory=~/.vim-tmp

" autocmd BufEnter * EnableStripWhitespaceOnSave


call plug#begin('~/.vim/plugged')
Plug 'lifepillar/vim-solarized8'
Plug 'neovim/nvim-lspconfig'
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  " We recommend updating the parsers on update

Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'kassio/neoterm'
Plug 'janko-m/vim-test'
Plug 'ntpeters/vim-better-whitespace'

Plug 'elixir-editors/vim-elixir'

Plug 'w0rp/ale'
Plug 'tpope/vim-fugitive'
" Plug 'vim-ruby/vim-ruby'
" Plug 'tpope/vim-rails'
"
Plug 'morhetz/gruvbox'
Plug 'sainnhe/gruvbox-material'

Plug 'TimUntersberger/neogit'

Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }

call plug#end()

let mapleader=","
let test#strategy='neoterm'

let g:gruvbox_material_background = 'hard'
colorscheme solarized8

nnoremap <leader>s <cmd>lua require('telescope.builtin').grep_string({search = vim.fn.input("Search > ")})<cr>
nnoremap <leader>f <cmd>lua require('telescope.builtin').find_files({})<cr>
nnoremap <leader>b <cmd>Telescope buffers<cr>

lua <<EOF
require('telescope').setup {
  extensions = {
    fzf = {
      fuzzy = true,                    -- false will only do exact matching
      override_generic_sorter = false, -- override the generic sorter
      override_file_sorter = true,     -- override the file sorter
      case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
                                       -- the default case_mode is "smart_case"
    }
  }
}
-- To get fzf loaded and working with telescope, you need to call
-- load_extension, somewhere after setup function:
require('telescope').load_extension('fzf')
EOF

nmap <leader>h :nohlsearch<cr>
nmap <leader>tn :TestNearest<cr>
nmap <leader>tf :TestFile<cr>
nmap <leader>tl :TestLast<cr>
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ALE configuration
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
      " \ 'reason': ['refmt'],
      " \ 'javascript': ['prettier'],
      " \ 'javascript': ['prettier'],
let g:ale_fixers = {
      \ 'ruby': ['rubocop'],
      \ 'elixir': ['mix_format'],
      \ 'javascript': ['prettier'],
      \ 'javascript.jsx': ['prettier'],
      \}
let g:ale_linters = {
      \ 'ruby': ['rubocop'],
      \ 'elixir': ['mix_format'],
      \}

let g:ale_enabled = 0
let g:ale_fix_on_save = 1
let g:ale_sign_column_always = 1
let g:ale_lint_delay=1000
let g:ale_linters_explicit = 1
let g:ale_ruby_rubocop_executable = 'bin/rubocop'

"""
" Treesitter config
"""
lua <<EOF
require'nvim-treesitter.configs'.setup {
  ensure_installed = "maintained", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
  -- ignore_install = { "javascript" }, -- List of parsers to ignore installing
  highlight = {
    enable = true,              -- false will disable the whole extension
    disable = { "c", "rust" },  -- list of language that will be disabled
  },
}
EOF

"""
" LSPs
""""

lua << EOF
local nvim_lsp = require('lspconfig')

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  --Enable completion triggered by <c-x><c-o>
  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  local opts = { noremap=true, silent=true }

  -- See `:help vim.lsp.*` for documentation on any of the below functions
  buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
  buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  buf_set_keymap('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
  buf_set_keymap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  buf_set_keymap('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  buf_set_keymap('n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  buf_set_keymap('n', '<space>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
  buf_set_keymap('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
  buf_set_keymap('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
  buf_set_keymap('n', '<space>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
  buf_set_keymap("n", "<space>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)

end

-- Use a loop to conveniently call 'setup' on multiple servers and
-- map buffer local keybindings when the language server attaches
local servers = {"solargraph"}
for _, lsp in ipairs(servers) do
  nvim_lsp[lsp].setup { on_attach = on_attach }
end
EOF

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" better_whitespace
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:better_whitespace_enabled=1
let g:strip_whitespace_on_save=1
let g:strip_whitespace_confirm=0

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" neoterm mode
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:neoterm_autoinsert=1
let g:neoterm_default_mod="botright"
tnoremap <Esc> <C-\><C-n>
tnoremap <A-[> <Esc>
tnoremap <a-h> <c-\><c-n><c-w>h
tnoremap <a-j> <c-\><c-n><c-w>j
tnoremap <a-k> <c-\><c-n><c-w>k
tnoremap <a-l> <c-\><c-n><c-w>l
nnoremap <a-h> <c-w>h
nnoremap <a-j> <c-w>j
nnoremap <a-k> <c-w>k
nnoremap <a-l> <c-w>l
tnoremap <expr> <A-r> '<C-\><C-n>"'.nr2char(getchar()).'pi'
highlight TermCursorNC ctermfg=4 guifg=none guibg=none
hi ErrorMsg ctermfg=1 ctermbg=4 guifg=none guibg=none guisp=NONE cterm=NONE,reverse gui=NONE
" hi Error ctermfg=160 ctermbg=4 guifg=#dc322f guibg=NONE guisp=NONE cterm=NONE,bold gui=NONE,bold
"

""""""
" Neogit
""""
lua << EOF
local neogit = require('neogit')

neogit.setup {}
EOF
