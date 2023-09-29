return {
  "neovim/nvim-lspconfig",
  opts = {
    diagnostics = {
      virtual_text = false,
      float = {
        source = false,
        format = function(diagnostic)
          return string.format(
            "%s [%s: %s]",
            diagnostic.message,
            diagnostic.source,
            diagnostic.code
          )
        end,
      },
    },
    autoformat = true,
    format_notify = true,
  },
  init = function()
    local keys = require("lazyvim.plugins.lsp.keymaps").get()
    keys[#keys + 1] = { "<c-k>", false, mode = "i" }
    keys[#keys + 1] = { "]w", false }
    keys[#keys + 1] = { "[w", false }
  end,
}
