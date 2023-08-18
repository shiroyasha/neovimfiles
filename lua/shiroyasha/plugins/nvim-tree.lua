local setup, nvimtree = pcall(require, "nvim-tree")
if not setup then
	return
end

-- recommended settings from nvim-tree documenatation
vim.g.loaded = 1
vim.g.loaded_netrwPlugin = 1

nvimtree.setup({
	update_focused_file = {
		enable = false,
	},
	actions = {
		open_file = {
			window_picker = {
				enable = false,
			},
		},
	},

	on_attach = function(bufnr)
    local api = require("nvim-tree.api")

    local function opts(desc)
      return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
    end

    api.config.mappings.default_on_attach(bufnr)

    vim.keymap.set("n", "l",     api.node.open.replace_tree_buffer, opts("Edit Or Open"))
    vim.keymap.set('n', '<CR>',  api.node.open.replace_tree_buffer, opts("Edit Or Open"))
    vim.keymap.set("n", "H",     api.tree.collapse_all, opts("Collapse All"))
	end,
})

-- NOTE: disable fixed nvim-tree width and height
-- to allow creating splits naturally
local winopts = require("nvim-tree.view").View.winopts
winopts.winfixwidth = false
winopts.winfixheight = false

function NvimOpen()
	local core = require("nvim-tree.core")
	local view = require("nvim-tree.view")

	local cwd = vim.fn.getcwd()
	local current_buffer = vim.api.nvim_get_current_buf()
	local buffer_name = vim.api.nvim_buf_get_name(current_buffer)
	local is_no_name_buffer = buffer_name == ""

	if is_no_name_buffer then
		core.init(cwd)

		view.open_in_win({
			hijack_current_buf = false,
			resize = false,
		})

		require("nvim-tree.renderer").draw()
	else
		local bufname = vim.api.nvim_buf_get_name(current_buffer)

		core.init(cwd)

		view.open_in_win({
			hijack_current_buf = false,
			resize = false,
		})

		require("nvim-tree.renderer").draw()
		require("nvim-tree.actions.finders.find-file").fn(bufname)
	end
end
