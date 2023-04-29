local Plug = vim.fn['plug#']

vim.call('plug#begin', "/home/dev/.config/nvim/plugged")

Plug('nvim-lua/plenary.nvim')

Plug('tpope/vim-commentary')
Plug('tpope/vim-surround')

Plug('bluz71/vim-nightfly-colors', {as = 'nightfly' })
Plug('christoomey/vim-tmux-navigator')
Plug('szw/vim-maximizer')

Plug('nvim-tree/nvim-tree.lua')
Plug('nvim-tree/nvim-web-devicons')
Plug('nvim-lualine/lualine.nvim')

Plug("nvim-telescope/telescope.nvim", {branch = "0.1.x" })

-- autocompletion
Plug("hrsh7th/nvim-cmp")   -- completion plugin
Plug("hrsh7th/cmp-buffer") -- source for text in buffer
Plug("hrsh7th/cmp-path")   -- source for file system paths

Plug('shiroyasha/make-test')

Plug('elixir-editors/vim-elixir')
Plug('fatih/vim-go')
Plug('mhinz/vim-mix-format')
Plug('github/copilot.vim')
Plug('neovim/nvim-lspconfig')

-- Plug 'hrsh7th/cmp-nvim-lsp', { 'branch' = 'main' }
-- Plug 'hrsh7th/cmp-buffer', { 'branch' = 'main' }
-- Plug 'hrsh7th/cmp-path', { 'branch' = 'main' }
-- Plug 'hrsh7th/cmp-cmdline', { 'branch' = 'main' }
-- Plug 'hrsh7th/nvim-cmp', { 'branch' = 'main' }
-- Plug 'neoclide/coc.nvim', { 'branch' = 'release'}

vim.call('plug#end')
