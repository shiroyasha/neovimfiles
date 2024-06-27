require("shiroyasha.plugins")

require("shiroyasha.core.options")
require("shiroyasha.core.colorscheme")
require("shiroyasha.core.misc")

require("shiroyasha.plugins.lualine")
require("shiroyasha.plugins.nvim-tree")
require("shiroyasha.plugins.nvim-lualine")
require("shiroyasha.plugins.telescope")
require("shiroyasha.plugins.nvim-cmp")
require("shiroyasha.plugins.treesitter")

require("shiroyasha.plugins.lsp.lspconfig")
require("shiroyasha.plugins.lsp.typescript")
require("shiroyasha.plugins.lsp.file-operations")

require("shiroyasha.plugins.autopairs")
require("shiroyasha.plugins.treesitter")
require("shiroyasha.plugins.gitsigns")

require("shiroyasha.plugins.commandmenu")

require("shiroyasha.core.keymaps")

--
-- experimental
--

vim.api.nvim_create_user_command('LoadPathsFromTxt', function()
  local files = vim.fn.readfile('/tmp/paths.txt')
  local quickfix_list = {}

  for _, file in ipairs(files) do
    local parts = vim.split(file, ':')
    table.insert(quickfix_list, { filename = parts[1], lnum = tonumber(parts[2]), text = '' })
  end

  vim.fn.setqflist(quickfix_list)
  vim.cmd('copen')
end, {})
