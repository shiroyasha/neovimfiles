require("shiroyasha.plugins")

require("shiroyasha.core.options")
require("shiroyasha.core.colorscheme")
require("shiroyasha.core.misc")

require("shiroyasha.plugins.lualine")
require("shiroyasha.plugins.nvim-tree")
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

require("mini.diff").setup({})

require("codecompanion").setup({
  strategies = {
    chat = {
      adapter = "anthropic",
    },
  },
  adapters = {
    anthropic = function()
      return require("codecompanion.adapters").extend("anthropic", {
        env = {
          api_key = "cmd:cat ~/.claude-api-key | tr -d '\n'",
        },
      })
    end,
  },
  display = {
    diff = {
      enabled = true,
      close_chat_at = 240, -- Close an open chat buffer if the total columns of your display are less than...
      layout = "vertical", -- vertical|horizontal split for default provider
      opts = { "internal", "filler", "closeoff", "algorithm:patience", "followwrap", "linematch:120" },
      provider = "mini_diff",
    },
  },
  opts = {
    -- Set debug logging
    log_level = "DEBUG",
  },
})

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

vim.api.nvim_create_user_command("GenSteps", function()
  -- Get the range of the visual selection
  local line_start, line_end = vim.fn.line("'<"), vim.fn.line("'>")

  -- Placeholder for the result
  local new_lines = {}

  -- Loop through the selected lines
  for line = line_start, line_end do
    local content = vim.fn.getline(line)

    -- Match and capture the function name after `Steps.`
    local function_name = content:match("Steps%.([%w_]+)")

    if function_name then
      -- Create the new line format
      table.insert(new_lines, "  step :" .. function_name .. ", ctx do")
      table.insert(new_lines, "    ctx |> UI.click(testid: \"something\")")
      table.insert(new_lines, "  end")
      table.insert(new_lines, "") -- For a line break
    end
  end
  --
  -- Insert the new lines below the selection
  vim.fn.append(line_end, new_lines)

  -- Delete the original selected lines
  vim.api.nvim_buf_set_lines(0, line_start - 1, line_end, false, {})
end, { range = true })
