local function map(mode, lhs, rhs, opts)
  local keys = require("lazy.core.handler").handlers.keys
  ---@cast keys LazyKeysHandler
  -- do not create the keymap if a lazy keys handler exists
  if not keys.active[keys.parse({ lhs, mode = mode }).id] then
    opts = opts or {}
    opts.silent = opts.silent ~= false
    vim.keymap.set(mode, lhs, rhs, opts)
  end
end

return {
  "abeleinin/papyrus",
  ft = { "markdown" },
  config = function()
    vim.g.papyrus_viewer = "open -a /Applications/Skim.app"
    -- vim.g.papyrus_latex_engine = "lualatex"
    -- vim.g.papyrus_pandoc_args = "-V documentclass=bxjsarticle " .. "-V classoption=pandoc "
    vim.g.papyrus_latex_engine = "xelatex"
    vim.g.papyrus_pandoc_args = '--template "eisvogel" '
      .. "--listings "
      .. '-V CJKmainfont="HiraginoSans-W4"'
    -- vim.g.papyrus_output_path = vim.fn.expand("$TMPDIR/papyrus/")
    vim.g.papyrus_output_path = "/tmp/papyrus/"
    vim.fn.mkdir(vim.g.papyrus_output_path, "p")

    map("n", "<leader>pc", ":PapyrusCompile<CR>", { desc = "Compile the md file." })
    map("n", "<leader>pa", ":PapyrusAutoCompile<CR>", { desc = "Set auto compile the md file." })
    map("n", "<leader>pv", ":PapyrusView<CR>", { desc = "Open in the pdf viewer." })
    map("n", "<leader>ps", ":PapyrusStart<CR>", { desc = "Auto compile and view." })
  end,
}
