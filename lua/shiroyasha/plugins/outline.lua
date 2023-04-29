-- import gitsigns plugin safely
local setup, outline = pcall(require, "symbols-outline")
if not setup then
	return
end

-- configure/enable gitsigns
outline.setup({
	autofold_depth = 2,
})
