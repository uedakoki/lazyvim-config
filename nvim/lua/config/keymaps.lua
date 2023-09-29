-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local Util = require("lazyvim.util")

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

map("n", "x", '"_x')
map("v", "x", '"_x')

map("v", "y", "y`>", { desc = "yank" })
map("i", "　", " ", { desc = "space" })
map("n", ";", ":", { desc = "command" })

-- Enter Normal mode
map("i", "jj", "<Esc>", { desc = "Enter Normal mode" })
map("t", "jj", "<C-\\><C-n>", { desc = "Enter Normal mode" })
map("t", "<C-W>[", "<C-\\><C-n>", { desc = "Enter Normal mode" })

-- cursor
map({ "n", "i", "t", "v" }, "<C-h>", "<Left>", { desc = "Cursor Left" })
map({ "n", "i", "t", "v" }, "<C-j>", "<Down>", { desc = "Cursor Down" })
map({ "n", "i", "t", "v" }, "<C-k>", "<Up>", { desc = "Cursor Up" })
map({ "n", "i", "t", "v" }, "<C-l>", "<Right>", { desc = "Cursor Right" })
map({ "i" }, "<C-o>", "<Esc>o", { desc = "Add line" })

-- window
map({ "n", "t" }, "<C-W>\\", "<CMD> vsplit <CR>", { desc = "Split window right" })
map({ "n", "t" }, "<C-W>-", "<CMD> split <CR>", { desc = "Split window below" })
map({ "n" }, "<leader>\\", "<CMD> vsplit <CR>", { desc = "Split window right" })
map({ "n" }, "<leader>-", "<CMD> split <CR>", { desc = "Split window below" })

-- buffers
if Util.has("bufferline.nvim") then
  map({ "n", "t" }, "[b", "<cmd>BufferLineCyclePrev<cr>", { desc = "Prev buffer" })
  map({ "n", "t" }, "]b", "<cmd>BufferLineCycleNext<cr>", { desc = "Next buffer" })
else
  map({ "n", "t" }, "]b", "<cmd>bnext<cr>", { desc = "Next buffer" })
  map({ "n", "t" }, "[b", "<cmd>bprevious<cr>", { desc = "Prev buffer" })
end
map({ "n" }, "<leader>bc", "<cmd>close<cr>", { desc = "Close" })
map({ "n" }, "<leader>bt", "<cmd>term<cr>", { desc = "Terminal" })
