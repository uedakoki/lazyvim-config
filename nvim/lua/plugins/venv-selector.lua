return {
  "linux-cultist/venv-selector.nvim",
  dependencies = { "neovim/nvim-lspconfig", "nvim-telescope/telescope.nvim" },
  event = "VeryLazy",
  opts = {
    name = { "venv", ".venv" },
    path = vim.env.HOME .. ".local/share/pdm/venvs",
  },
}
