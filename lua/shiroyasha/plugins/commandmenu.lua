local actions = require('telescope.actions')
local action_state = require('telescope.actions.state')
local pickers = require('telescope.pickers')
local finders = require('telescope.finders')
local conf = require('telescope.config').values
local telescopeBuiltin = require('telescope.builtin')

local my_custom_commands = {
  { description = "Typescript: Organize Imports", command = function() vim.cmd("TSToolsOrganizeImports") end },
  { description = "Typescript: Remove Unused", command = function() vim.cmd("TSToolsRemoveUnused") end },
  { description = "Typescript: Add Missing Imports", command = function() vim.cmd("TSToolsAddMissingImports") end },
  { description = "Find references (gr)", command = function() vim.lsp.buf.references() end },
  { description = "Type Definition (gt)", command = function() vim.lsp.buf.type_definition() end },
  { description = "List all diagnostics", command = function() telescopeBuiltin.diagnostics() end },
  { description = "Buffers", command = function() telescopeBuiltin.buffers() end },
  { description = "Git: History of current file", command = function() telescopeBuiltin.git_bcommits() end },
  { description = "Git: Content of file on main branch", command = function() preview_main_file() end }
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

--
-- Preview file content from the `main` branch
--

local function current_buffer_filepath()
  local filepath = vim.fn.expand("%:p")
  local project_root = vim.fn.systemlist("git rev-parse --show-toplevel")[1]

  if vim.v.shell_error ~= 0 then
    print("Not in a git repository")
    return
  end

  return vim.fn.fnamemodify(filepath, ":~:." .. project_root)
end

function preview_main_file()
  local filepath = current_buffer_filepath()
  if not filepath then
    return
  end

  local file_content = vim.fn.systemlist("git show main:" .. filepath)
  if vim.v.shell_error ~= 0 then
    return
  end

  -- create split window with file content
  vim.cmd("vsplit")
  vim.cmd("enew")
  vim.cmd("setlocal buftype=nofile bufhidden=wipe nobuflisted noswapfile")
  vim.cmd("setlocal readonly")
  vim.api.nvim_buf_set_lines(0, 0, -1, false, file_content)
end

