vim.g.nightflyTransparent = true

local status, _ = pcall(vim.cmd, "colorscheme nightfly")
if not status then
  print("Colorshcme not found!")
  return
end

