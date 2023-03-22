return {
  "yazgoo/vmux",
  build = "cargo install vmux",
  keys = {
    { "<C-W>-", "<CMD>VmuxSplit<CR>", desc = "vmux horizontal split" },
    { "<C-W>\\", "<CMD>VmuxVsplit<CR>", desc = "vmux vertical split" },
  },
}
