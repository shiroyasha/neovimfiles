local elixir = require("elixir")
-- local elixirls = require("elixir.elixirls")

elixir.setup {
  nextls = {
    enable = true,

    on_attach = function(client, bufnr)
      vim.keymap.set("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
      vim.keymap.set("n", "<leader>dd", "<cmd>lua vim.diagnostic.open_float()<CR>", opts)
    end,
  },
  -- elixirls = {
  --   enable = true,
  --   settings = elixirls.settings {
  --     dialyzerEnabled = false,
  --     enableTestLenses = false,
  --   },
  -- }
}
