local function close_float()
  -- removes any stuck floating window
  for _, win in ipairs(vim.api.nvim_list_wins()) do
    local config = vim.api.nvim_win_get_config(win)
    if config.relative ~= "" then
      vim.api.nvim_win_close(win, false)
      print("Closing window", win)
    end
  end
end

return {
  "dccsillag/magma-nvim",
  cmd = "MagmaInit",
  -- build = "pip install --user jupyter_client",
  build = "rye install -f jupyter_client",
  keys = {
    { "<LocalLeader>r",  ":<C-u>MagmaEvaluateVisual<CR>", mode = { "x" } },
    { "<C-o>",           ":<C-u>MagmaEvaluateVisual<CR>", mode = { "x" } },
    { "<LocalLeader>rr", "<CMD>MagmaEvaluateLine<CR>" },
    {
      "<LocalLeader>rc",
      function()
        close_float()
        vim.cmd("MagmaReevaluateCell")
      end,
    },
    {
      "<C-o>",
      function()
        close_float()
        vim.cmd("MagmaReevaluateCell")
      end,
    },
    {
      "<LocalLeader>rd",
      function()
        close_float()
        vim.cmd("MagmaDelete")
      end,
    },
    { "<LocalLeader>ro", "<CMD>MagmaShowOutput<CR>" },
    {
      "<LocalLeader>rq",
      function()
        close_float()
      end,
    },
    { "<LocalLeader>ri", "<CMD>noautocmd MagmaEnterOutput<CR>" },
  },
}
