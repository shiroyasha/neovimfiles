require("shiroyasha.plugins")

require("shiroyasha.core.options")
require("shiroyasha.core.colorscheme")

require("shiroyasha.plugins.nvim-tree")
require("shiroyasha.plugins.nvim-lualine")
require("shiroyasha.plugins.telescope")
require("shiroyasha.plugins.nvim-cmp")
require("shiroyasha.plugins.treesitter")

require("shiroyasha.plugins.lsp.lspconfig")

require("shiroyasha.plugins.autopairs")
require("shiroyasha.plugins.treesitter")
require("shiroyasha.plugins.gitsigns")

require("shiroyasha.core.keymaps")

vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('UserLspConfig', {}),
  callback = function(ev)
    vim.keymap.set({ 'n', 'v' }, '<leader>a', vim.lsp.buf.code_action, opts)
  end,
})
