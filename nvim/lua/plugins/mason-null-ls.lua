return {
  "jay-babu/mason-null-ls.nvim",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "williamboman/mason.nvim",
    -- "jose-elias-alvarez/null-ls.nvim",
    "nvimtools/none-ls.nvim",
  },
  opts = {
    automatic_setup = true,
    handlers = {},
  }
}
