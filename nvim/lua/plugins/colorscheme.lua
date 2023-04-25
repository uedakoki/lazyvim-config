-- return {
--   "folke/tokyonight.nvim",
--   lazy = true,
--   opts = { style = "night" },
-- }
return {
  {
    "folke/tokyonight.nvim",
    opts = nil,
  },
  {
    "catppuccin/nvim",
    lazy = true,
    name = "catppuccin",
    opts = {
      flavour = "mocha",
      color_overrides = {
        mocha = {
          base = "#000000",
        },
      },
      no_italic = true,
      integrations = {
        notify = true,
        mini = true,
      },
    },
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "catppuccin",
    },
  },
}
