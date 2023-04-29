vim.g.mapleader = " "

local km = vim.keymap -- for consicesess

km.set("n", "<CR>", ":nohl<CR>")                             -- clear highlighted words with hitting ENTER

km.set("n", "<leader>ss", "<C-w>v")                          -- split window vertically
km.set("n", "<leader>sh", "<C-w>s")                          -- split window horizontally
km.set("n", "<leader>se", "<C-w>=")                          -- make split windows equal width
km.set("n", "<leader>sx", ":close<CR>")                      -- close current split
km.set("n", "<leader>sm", ":MaximizerToggle<CR>")            -- maximizes current toggle

km.set("n", "<leader>tt", ":tabnew<CR>")                     -- open new tab
km.set("n", "<leader>tx", ":tabclose<CR>")                   -- close current tab
km.set("n", "<leader>tn", ":tabn<CR>")                       -- next tab
km.set("n", "<leader>tp", ":tabp<CR>")                       -- prev tab
km.set("n", "<leader>tp", ":tabp<CR>")                       -- prev tab

km.set("n", "<leader>e", ":NvimTreeToggle<CR>")              -- toggle nvim tree

km.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>")   -- find files within current working directory, respects .gitignore
km.set("n", "<leader>fs", "<cmd>Telescope live_grep<cr>")    -- find string in current working directory as you type
km.set("n", "<leader>fc", "<cmd>Telescope grep_string<cr>")  -- find string under cursor in current working directory
km.set("n", "<leader>fb", "<cmd>Telescope buffers<cr>")      -- list open buffers in current neovim instance
km.set("n", "<leader>fh", "<cmd>Telescope help_tags<cr>")    -- list available help tags
