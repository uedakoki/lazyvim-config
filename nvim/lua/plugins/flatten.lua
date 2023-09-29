return {
  "willothy/flatten.nvim",
  -- Ensure that it runs first to minimize delay when opening file from terminal
  lazy = false,
  priority = 1001,
  config = function()
    require("flatten").setup(
      {
        window = {
          open = "alternate",
          diff = "vsplit",
          focus = "first",
        },
        one_per = {
          wezterm = false,
        },
      }
    )
  end
}
