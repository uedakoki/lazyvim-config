return {
  "willothy/flatten.nvim",
  -- Ensure that it runs first to minimize delay when opening file from terminal
  lazy = false,
  priority = 1001,
  config = function()
    require("flatten").setup(
      {
        window = {
          open = "current",
          diff = "vsplit",
          focus = "first",
        },
        one_per = {
          wezterm = true,
        },
        pipe_path = require("flatten").default_pipe_path
      }
    )
  end
}
