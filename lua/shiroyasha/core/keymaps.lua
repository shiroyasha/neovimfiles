vim.g.mapleader = " "

local km = vim.keymap -- for consicesess

km.set("n", "<CR>", ":nohl<CR>") -- clear highlighted words with hitting ENTER

km.set("n", "<leader>s", "<C-w>v") -- split window vertically
km.set("n", "<leader>v", "<C-w>s") -- split window horizontally

km.set("n", "<leader>p", "<cmd>Telescope find_files<cr>") -- find files within current working directory, respects .gitignore
km.set("n", "<leader>f", "<cmd>Telescope live_grep<cr>") -- find string in current working directory as you type
km.set("n", "<leader>b", "<cmd>Telescope buffers<cr>") -- list open buffers in current neovim instance

km.set("n", "<leader>t", ":MakeTestFileLine<CR>") -- run test on current line
km.set("n", "<leader>T", ":MakeTestFile<CR>") -- run test on current file

km.set("n", "<leader>o", "<cmd>Lspsaga outline<CR>")

km.set("n", "<leader>e", NvimOpen, { desc = "nvim-tree: Open" })
km.set("n", "<leader>r", ":lua command_picker()<CR>", { desc = "Custom Commands" })

km.set("n", "<leader>q", ":q<CR>") -- quit
km.set("n", "<leader>Q", ":qa<CR>") -- quit all

km.set("n", "<leader>1", "1gt") -- go to tab 1
km.set("n", "<leader>2", "2gt") -- go to tab 2
km.set("n", "<leader>3", "3gt") -- go to tab 3
km.set("n", "<leader>4", "4gt") -- go to tab 4
km.set("n", "<leader>5", "5gt") -- go to tab 5
km.set("n", "<leader>6", "6gt") -- go to tab 6
km.set("n", "<leader>7", "7gt") -- go to tab 7
km.set("n", "<leader>8", "8gt") -- go to tab 8
km.set("n", "<leader>9", "9gt") -- go to tab 9
km.set("n", "<leader>0", ":tablast<CR>") -- go to last tab

km.set("n", "[q", ":cprev<CR>") -- go to previous quickfix item
km.set("n", "]q", ":cnext<CR>") -- go to next quickfix item

--
-- LSP mappings
--

local opts = { noremap = true, silent = true, buffer = bufnr }

km.set("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
km.set("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
km.set("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
km.set("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
km.set("n", "gs", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
km.set("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
km.set("n", "gt", "<cmd>lua vim.lsp.buf.type_definition()<CR>", opts)
km.set("n", "<leader>gw", "<cmd>lua vim.lsp.buf.document_symbol()<CR>", opts)
km.set("n", "<leader>gW", "<cmd>lua vim.lsp.buf.workspace_symbol()<CR>", opts)
km.set("n", "<leader>ah", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
km.set("n", "<leader>af", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)
km.set("n", "<leader>ar", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
km.set("n", "<leader>=", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
km.set("n", "<leader>ai", "<cmd>lua vim.lsp.buf.incoming_calls()<CR>", opts)
km.set("n", "<leader>ao", "<cmd>lua vim.lsp.buf.outgoing_calls()<CR>", opts)
km.set("n", "<leader>dd", "<cmd>lua vim.diagnostic.open_float()<CR>", opts)
km.set("n", "<leader>dn", "<cmd>lua vim.diagnostic.goto_next()<CR>", opts)
km.set("n", "<leader>dp", "<cmd>lua vim.diagnostic.goto_prev()<CR>", opts)
km.set({ 'n', 'v' }, '<leader>a', vim.lsp.buf.code_action, opts)
