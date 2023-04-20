return {
  "abeleinin/papyrus",
  ft = { "markdown" },
  config = function()
    vim.g.papyrus_latex_engine = "lualatex"
    vim.g.papyrus_viewer = "displayline"
    vim.g.papyrus_pandoc_args = "-V documentclass=bxjsarticle " .. "-V classoption=pandoc "
    vim.g.papyrus_output_path = "/tmp/papyrus/"
  end,
  keys = {
    { "<leader>pc", ":PapyrusCompile<CR>", desc = "Compile the md file." },
    { "<leader>pa", ":PapyrusAutoCompile<CR>", desc = "Set auto compile the md file." },
    { "<leader>pv", ":PapyrusView<CR>", desc = "Open in the pdf viewer." },
    { "<leader>ps", ":PapyrusStart<CR>", desc = "Auto compile and view." },
  },
}
