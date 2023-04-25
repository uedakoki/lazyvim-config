return {
  "CRAG666/code_runner.nvim",
  event = "BufRead",
  opts = {
    mode = "float",
    focas = false, -- only works on toggle, term and tab mode
    float = {
      blend = 20,
    },
    term = {
      position = "bot",
      size = 8,
    },
    project_path = vim.fn.expand("~/.config/nvim/misc/project_manager.json"),
    filetype = {
      cpp = {
        "OUTFILE=/tmp/code_runner/$fileNameWithoutExt; ",
        "mkdir -p $(dirname $OUTFILE) &&",
        "g++ $file -o $OUTFILE &&",
        "$OUTFILE",
      },
      html = {
        "cd $dir &&",
        [[(sleep 1 && open http://localhost:8080 -a /Applications/Google\ Chrome.app)& ;]],
        "php -S localhost:8080",
      },
    },
  },
  keys = {
    { "<leader>rf", "<cmd>RunFile<CR>", desc = "Run the current file" },
    { "<leader>rbf", "<cmd>RunFile term<CR>", desc = "Run the current file (term)" },
    { "<leader>rp", "<cmd>RunProject<CR>", desc = "Run the current project" },
    { "<leader>rbp", "<cmd>RunProject term<CR>", desc = "Run the current project (term)" },
  },
}
