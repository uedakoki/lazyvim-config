return {
  "m4xshen/smartcolumn.nvim",
  event = "BufReadPost",
  opts = {
    colorcolumn = "120",
    disabled_filetypes = { "NvimTree", "lazy", "mason", "help" },
    scope = "file",
  },
}
