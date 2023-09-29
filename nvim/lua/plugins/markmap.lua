return {
  "Zeioth/markmap.nvim",
  build = "npm install -g markmap-cli",
  cmd = { "MarkmapOpen", "MarkmapSave", "MarkmapWatch", "MarkmapWatchStop" },
  ft = { "markdown" },
  opts = {
    html_output = "/tmp/nvim/markmap.html",
    hide_toolbar = false,
    grace_period = 3600000,
  },
  config = function(_, opts)
    require("markmap").setup(opts)
  end,
}
