return {
  -- "jose-elias-alvarez/null-ls.nvim",
  "nvimtools/none-ls.nvim",
  opts = function()
    local nls = require("null-ls")
    return {
      sources = {
        nls.builtins.formatting.shfmt.with({
          args = { "-i", "4" },
        }),
        nls.builtins.formatting.black.with({
          args = { "--preview", "--stdin-filename", "$FILENAME", "--quiet", "-" }
        })
      },
    }
  end,
}
