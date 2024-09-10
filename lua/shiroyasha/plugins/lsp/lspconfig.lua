local lsp_status = require('lsp-status')
lsp_status.register_progress()

vim.lsp.set_log_level("debug")

local cmp = require('cmp')
local protocol = require('vim.lsp.protocol')

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

lspconfig.cssls.setup({
	capabilities = capabilities,
})

lspconfig.tailwindcss.setup({
	capabilities = capabilities,
  filetypes = { "typescriptreact" }
})

lspconfig.emmet_language_server.setup({
	capabilities = capabilities,
	filetypes = { "html", "typescriptreact", "javascriptreact", "css", "sass", "scss", "less", "svelte" },
})

lspconfig.elixirls.setup {
  cmd = { "/home/dev/code/elixir-ls/language_server.sh" },
  capabilities = capabilities,
  flags = {
    debounce_text_changes = 150,
  },
  elixirLS = {
    dialyzerEnabled = false,
    fetchDeps = false,
  };
}
