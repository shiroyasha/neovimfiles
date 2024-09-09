local lsp_status = require('lsp-status')
lsp_status.register_progress()

local cmp = require('cmp')
local protocol = require('vim.lsp.protocol')

cmp.setup {
  sources = {
    { name = 'nvim_lsp' }
  }
}

local on_attach = function(client, bufnr)
	local opts = { noremap = true, silent = true, buffer = bufnr }

	vim.keymap.set("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
	vim.keymap.set("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
	vim.keymap.set("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
	vim.keymap.set("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
	vim.keymap.set("n", "gs", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
	vim.keymap.set("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
	vim.keymap.set("n", "gt", "<cmd>lua vim.lsp.buf.type_definition()<CR>", opts)
	vim.keymap.set("n", "<leader>gw", "<cmd>lua vim.lsp.buf.document_symbol()<CR>", opts)
	vim.keymap.set("n", "<leader>gW", "<cmd>lua vim.lsp.buf.workspace_symbol()<CR>", opts)
	vim.keymap.set("n", "<leader>ah", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
	vim.keymap.set("n", "<leader>af", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)
	vim.keymap.set("n", "<leader>ar", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
	vim.keymap.set("n", "<leader>=", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
	vim.keymap.set("n", "<leader>ai", "<cmd>lua vim.lsp.buf.incoming_calls()<CR>", opts)
	vim.keymap.set("n", "<leader>ao", "<cmd>lua vim.lsp.buf.outgoing_calls()<CR>", opts)
	vim.keymap.set("n", "<leader>dd", "<cmd>lua vim.diagnostic.open_float()<CR>", opts)
	vim.keymap.set("n", "<leader>dn", "<cmd>lua vim.diagnostic.goto_next()<CR>", opts)
	vim.keymap.set("n", "<leader>dp", "<cmd>lua vim.diagnostic.goto_prev()<CR>", opts)

  vim.keymap.set({ 'n', 'v' }, '<leader>a', vim.lsp.buf.code_action, opts)
end

local capabilities = require('cmp_nvim_lsp').default_capabilities()
local lspconfig = require('lspconfig')

lspconfig.html.setup({
	capabilities = capabilities,
	on_attach = on_attach
})

lspconfig.cssls.setup({
	capabilities = capabilities,
	on_attach = on_attach
})

lspconfig.tailwindcss.setup({
	capabilities = capabilities,
	on_attach = on_attach,
  filetypes = { "typescriptreact" }
})

lspconfig.emmet_language_server.setup({
	capabilities = capabilities,
	on_attach = on_attach,
	filetypes = { "html", "typescriptreact", "javascriptreact", "css", "sass", "scss", "less", "svelte" },
})
