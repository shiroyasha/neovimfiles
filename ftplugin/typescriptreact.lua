function find_include_expr(import_path)
  if vim.fn.filereadable(import_path) == 1 then return import_path end

  path = "./assets/js" .. import_path .. ".tsx"
  if vim.fn.filereadable(path) == 1 then return path end

  path = "./assets/js" .. import_path .. "/index.tsx"
  if vim.fn.filereadable(path) == 1 then return path end

  path = "./assets/js" .. import_path .. ".ts"
  if vim.fn.filereadable(path) == 1 then return path end

  path = "./assets/js" .. import_path .. "/index.ts"
  if vim.fn.filereadable(path) == 1 then return path end

  path = "./assets/js" .. import_path .. ".jsx"
  if vim.fn.filereadable(path) == 1 then return path end

  path = "./assets/js" .. import_path .. "/index.jsx"
  if vim.fn.filereadable(path) == 1 then return path end

  path = "./assets/js" .. import_path .. ".js"
  if vim.fn.filereadable(path) == 1 then return path end

  path = "./assets/js" .. import_path .. "/index.js"
  if vim.fn.filereadable(path) == 1 then return path end

  return import_path
end

vim.opt_local.includeexpr = "v:lua.find_include_expr(v:fname)"
