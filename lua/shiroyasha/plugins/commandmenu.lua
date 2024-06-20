local actions = require('telescope.actions')
local action_state = require('telescope.actions.state')
local pickers = require('telescope.pickers')
local finders = require('telescope.finders')
local conf = require('telescope.config').values

local my_custom_commands = {
  { description = "TS only: Organize Imports", command = function() vim.cmd("TSToolsOrganizeImports") end },
  { description = "TS only: Remove Unused", command = function() vim.cmd("TSToolsRemoveUnused") end },
  { description = "TS only: Add Missing Imports", command = function() vim.cmd("TSToolsAddMissingImports") end },
  { description = "Find references (gr)", command = function() vim.lsp.buf.references() end },
  { description = "Type Definition (gt)", command = function() vim.lsp.buf.type_definition() end },
}

function command_picker()
  pickers.new({}, {
    prompt_title = "Custom Commands",
    finder = finders.new_table({
      results = my_custom_commands,
      entry_maker = function(entry)
        return {
          value = entry,
          display = entry.description,
          ordinal = entry.description,
        }
      end
    }),

    sorter = conf.generic_sorter({}),
    attach_mappings = function(_, map)
      actions.select_default:replace(function(bufnr)
        local selection = action_state.get_selected_entry(bufnr)
        actions.close(bufnr)
        selection.value.command()
      end)
      return true
    end,
  }):find()
end
