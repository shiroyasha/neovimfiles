vim.g.mapleader = " "

local km = vim.keymap -- for consicesess

km.set("n", "<CR>", ":nohl<CR>") -- clear highlighted words with hitting ENTER

km.set("n", "<leader>s", "<C-w>v") -- split window vertically
km.set("n", "<leader>v", "<C-w>s") -- split window horizontally
km.set("n", "<leader>e", ":NvimTreeToggle<CR>") -- toggle nvim tree

km.set("n", "<leader>p", "<cmd>Telescope find_files<cr>") -- find files within current working directory, respects .gitignore
km.set("n", "<leader>f", "<cmd>Telescope live_grep<cr>") -- find string in current working directory as you type
km.set("n", "<leader>b", "<cmd>Telescope buffers<cr>") -- list open buffers in current neovim instance

km.set("n", "<leader>t", ":MakeTestFileLine<CR>") -- run test on current line
km.set("n", "<leader>T", ":MakeTestFile<CR>") -- run test on current file

km.set("n", "<leader>o", "<cmd>Lspsaga outline<CR>")

km.set("n", "<leader>e", NvimOpen, { desc = "nvim-tree: Open" })

-- Case Change

local function snakeCase()
	local word = vim.fn.expand("<cword>")
	local converted = word:gsub("([a-z])([A-Z])", "%1_%2"):lower()

	-- diw deletes the current word
	-- i insert
	-- and the camel_case_word

	vim.cmd("normal! diwi" .. converted)
end

local function camelCase()
	local word = vim.fn.expand("<cword>")
	local converted = word:gsub("(_)([a-z])", function(_, l)
		return l:upper()
	end)

	-- diw deletes the current word
	-- i insert
	-- and the camel_case_word

	vim.cmd("normal! diwi" .. converted)
end

km.set("n", "<leader>cc", camelCase, { desc = "camelCase" })
km.set("n", "<leader>cs", snakeCase, { desc = "snake_case" })
