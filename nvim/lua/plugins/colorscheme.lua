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
      custom_highlights = function(colors)
        return {
          VertSplit = { fg = colors.surface0 },
        }
      end,
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
