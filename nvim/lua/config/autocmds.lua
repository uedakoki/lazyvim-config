-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

local function augroup(name)
  return vim.api.nvim_create_augroup("lazyvim_" .. name, { clear = true })
end

local autocmd = vim.api.nvim_create_autocmd

autocmd({ "TermOpen" }, {
  group = augroup("term_open"),
  pattern = { "*" },
  callback = function()
    vim.opt_local.number = false
    vim.cmd("startinsert")
  end,
})

autocmd({ "FileType" }, {
  group = augroup("file_type"),
  pattern = { "lua" },
  callback = function()
    vim.bo.shiftwidth = 2
    vim.bo.tabstop = 2
  end,
})
