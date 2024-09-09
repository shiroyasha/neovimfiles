local Plug = vim.fn["plug#"]

vim.call("plug#begin", "/home/dev/.config/nvim/plugged")

-- Shared Lua functions for Neovim plugins
Plug("nvim-lua/plenary.nvim")

Plug("tpope/vim-commentary")
Plug("tpope/vim-surround")
Plug("tpope/vim-projectionist")

Plug("bluz71/vim-nightfly-colors", { as = "nightfly" })
Plug("christoomey/vim-tmux-navigator")
Plug("szw/vim-maximizer")

Plug("nvim-tree/nvim-tree.lua", { commit = "b8c3a23e76f861d5f0ff3f6714b9b56388984d0b" }) -- there is a bug in the latest version, see: https://github.com/nvim-tree/nvim-tree.lua/pull/2627/files
Plug("nvim-tree/nvim-web-devicons")
Plug("nvim-lualine/lualine.nvim")

Plug("nvim-telescope/telescope.nvim", { branch = "0.1.x" })

-- autocompletion
Plug("hrsh7th/nvim-cmp") -- completion plugin
Plug("hrsh7th/cmp-buffer") -- source for text in buffer
Plug("hrsh7th/cmp-path") -- source for file system paths

-- snippets
Plug("L3MON4D3/LuaSnip") -- snippet engine
Plug("saadparwaiz1/cmp_luasnip") -- for autocompletion
Plug("rafamadriz/friendly-snippets") -- Plugful snippets

Plug("shiroyasha/make-test")

-- Plug("elixir-tools/elixir-tools.nvim")

-- Plug("fatih/vim-go")
Plug("mhinz/vim-mix-format")
Plug("github/copilot.vim")

-- configuring lsp servers
Plug("neovim/nvim-lspconfig") -- easily configure language servers
Plug("hrsh7th/cmp-nvim-lsp") -- for autocompletion
Plug("pmizio/typescript-tools.nvim") -- custom typescript lsp (faster than tsserver)
Plug("antosha417/nvim-lsp-file-operations") -- communicate with LSP for file operations

Plug("sbdchd/neoformat")

Plug("nvim-lua/lsp-status.nvim")


vim.cmd [[
augroup fmt
  autocmd!
  autocmd BufWritePre *.tsx undojoin | Neoformat
augroup END
]]

-- treesitter configuration
Plug("nvim-treesitter/nvim-treesitter", {
	run = function()
		local ts_update = require("nvim-treesitter.install").update({ with_sync = true })
		ts_update()
	end,
})

-- auto closing
Plug("windwp/nvim-autopairs") -- autoclose parens, brackets, quotes, etc...
Plug("windwp/nvim-ts-autotag", { after = "nvim-treesitter" }) -- autoclose tags

-- git integration
Plug("lewis6991/gitsigns.nvim") -- show line modifications on left hand side

vim.call("plug#end")
