local lsp_status = require('lsp-status')
lsp_status.register_progress()

local cmp = require('cmp')
local protocol = require('vim.lsp.protocol')
local configs = require("lspconfig.configs")
local util = require('lspconfig.util')

cmp.setup {
  sources = {
    { name = 'nvim_lsp' }
  }
}

local capabilities = require('cmp_nvim_lsp').default_capabilities()
local lspconfig = require('lspconfig')

lspconfig.html.setup({
	capabilities = capabilities,
})

lspconfig.tailwindcss.setup({
	capabilities = capabilities,
  filetypes = { "typescriptreact" }
})

lspconfig.lexical.setup {
  cmd = { "/home/dev/code/lexical-lsp/lexical/_build/dev/package/lexical/bin/start_lexical.sh" },
  root_dir = function(fname)
    return util.root_pattern("mix.exs", ".git")(fname) or vim.loop.cwd()
  end,
  filetypes = { "elixir", "eelixir", "heex" },
  -- optional settings
  settings = {}
}

lspconfig.gleam.setup({})
