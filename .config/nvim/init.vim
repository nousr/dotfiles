"Remap ESC
imap jk <Esc>
"---

"Syntax Highlighting
syntax on
"---

"Enable more colors
:set termguicolors
"---

"Vertical Ruler
:set colorcolumn=80
"---

"No Psycho-tabs
:set tabstop=4
:set shiftwidth=4
:set expandtab
"---

"Line Numbers
:set number
:set relativenumber
"---


call plug#begin()

Plug 'projekt0n/github-nvim-theme'

call plug#end()

"Theme
:colorscheme github_dark_high_contrast

call plug#begin()

Plug 'nvim-tree/nvim-web-devicons' 
Plug 'akinsho/bufferline.nvim', { 'tag': '*' }

Plug 'nvim-lualine/lualine.nvim'
Plug 'nvim-tree/nvim-web-devicons'

Plug 'github/copilot.vim'

Plug 'kevinhwang91/rnvimr'

Plug 'stevearc/conform.nvim'

call plug#end()

"Enable lualine
:lua require('lualine').setup()
"---

"Enable Bufferline
:lua require('bufferline').setup{}
" ---

"Ranger Config
tnoremap <silent> <M-i> <C-\><C-n>:RnvimrResize<CR>
nnoremap <silent> <M-o> :RnvimrToggle<CR>
tnoremap <silent> <M-o> <C-\><C-n>:RnvimrToggle<CR>

" Make Ranger replace Netrw and be the file explorer
let g:rnvimr_enable_ex = 1

" Make Ranger to be hidden after picking a file
let g:rnvimr_enable_picker = 1

" Disable a border for floating window
let g:rnvimr_draw_border = 0

" Hide the files included in gitignore
let g:rnvimr_hide_gitignore = 1

" Link CursorLine into RnvimrNormal highlight in the Floating window
highlight link RnvimrNormal CursorLine
" ----

"Conform Config
lua << EOF
require("conform").setup({
  formatters_by_ft = {
    lua = { "stylua" },
    python = { "isort", "black" },
    javascript = { { "prettierd", "prettier" } },
  },
  format_on_save = {
      timeout_ms = 500,
      lsp_fallback = true,
    },
})
EOF

autocmd BufWritePre * lua require("conform").format({ bufnr = vim.api.nvim_get_current_buf() })
"---
