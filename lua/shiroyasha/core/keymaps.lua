vim.g.mapleader = " "

local km = vim.keymap -- for consicesess

km.set("n", "<CR>", ":nohl<CR>")                  -- clear highlighted words with hitting ENTER

km.set("n", "<leader>ss", "<C-w>v")               -- split window vertically
km.set("n", "<leader>sh", "<C-w>s")               -- split window horizontally
km.set("n", "<leader>se", "<C-w>=")               -- make split windows equal width
km.set("n", "<leader>sx", ":close<CR>")           -- close current split
km.set("n", "<leader>sm", ":MaximizerToggle<CR>") -- maximizes current toggle

km.set("n", "<leader>tt", ":tabnew<CR>")          -- open new tab
km.set("n", "<leader>tx", ":tabclose<CR>")        -- close current tab
km.set("n", "<leader>tn", ":tabn<CR>")            -- next tab
km.set("n", "<leader>tp", ":tabp<CR>")            -- prev tab
km.set("n", "<leader>tp", ":tabp<CR>")            -- prev tab

km.set("n", "<leader>e", ":NvimTreeToggle<CR>")
