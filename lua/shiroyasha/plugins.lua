local Plug = vim.fn["plug#"]

vim.call("plug#begin", "/home/dev/.config/nvim/plugged")

Plug("nvim-lua/plenary.nvim")

Plug("tpope/vim-commentary")
Plug("tpope/vim-surround")

Plug("bluz71/vim-nightfly-colors", { as = "nightfly" })
Plug("christoomey/vim-tmux-navigator")
Plug("szw/vim-maximizer")

Plug("nvim-tree/nvim-tree.lua")
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

Plug("elixir-editors/vim-elixir")
Plug("fatih/vim-go")
Plug("mhinz/vim-mix-format")
Plug("github/copilot.vim")
Plug("neovim/nvim-lspconfig")

-- managing & installing lsp servers, linters & formatters
Plug("williamboman/mason.nvim") -- in charge of managing lsp servers, linters & formatters
Plug("williamboman/mason-lspconfig.nvim") -- bridges gap b/w mason & lspconfig

-- configuring lsp servers
Plug("neovim/nvim-lspconfig") -- easily configure language servers
Plug("hrsh7th/cmp-nvim-lsp") -- for autocompletion
Plug("glepnir/lspsaga.nvim", {
	branch = "main",
	requires = {
		{ "nvim-tree/nvim-web-devicons" },
		{ "nvim-treesitter/nvim-treesitter" },
	},
}) -- enhanced lsp uis

Plug("jose-elias-alvarez/typescript.nvim") -- additional functionality for typescript server (e.g. rename file & update imports)
Plug("onsails/lspkind.nvim") -- vs-code like icons for autocompletion

-- formatting & linting
Plug("jose-elias-alvarez/null-ls.nvim") -- configure formatters & linters
Plug("jayp0521/mason-null-ls.nvim") -- bridges gap b/w mason & null-ls

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

Plug("ThePrimeagen/refactoring.nvim")

Plug("simrat39/symbols-outline.nvim")

Plug("mrjones2014/nvim-ts-rainbow")

vim.call("plug#end")
