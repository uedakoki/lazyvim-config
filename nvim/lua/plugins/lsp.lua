return {
  "neovim/nvim-lspconfig",
  init = function()
    local keys = require("lazyvim.plugins.lsp.keymaps").get()
    keys[#keys + 1] = { "<c-k>", false, mode = "i" }
    keys[#keys + 1] = { "]w", false }
    keys[#keys + 1] = { "[w", false }
  end,
}
