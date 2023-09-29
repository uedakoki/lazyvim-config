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

autocmd({ "BufEnter" }, {
  group = augroup("term_enter"),
  pattern = { "term:/*" },
  callback = function()
    vim.cmd("stopinsert")
    vim.cmd("normal G")
  end,
})

autocmd({ "FileType" }, {
  group = augroup("file_type"),
  pattern = { "python", "sh" },
  callback = function()
    vim.bo.shiftwidth = 4
    vim.bo.tabstop = 4
  end,
})

-- auto close
autocmd({ "FileType" }, {
  group = augroup("auto_close"),
  pattern = { "gitcommit" },
  callback = function()
    -- require("mini.bufremove").delete(0, false)
    vim.bo.bufhidden = "delete"
  end,
})

-- auto_compile
autocmd({ "BufWritePost" }, {
  group = augroup("auto_compile"),
  pattern = { "*.mmd" },
  callback = function()
    local buffile = vim.api.nvim_buf_get_name(0)
    local outfiletype = "pdf"
    local outfile = "/tmp/nvim/" .. vim.fn.fnamemodify(buffile, ":t:r") .. "." .. outfiletype
    local mkdir_cmd = "mkdir -p " .. vim.fn.fnamemodify(outfile, ":p:h")
    local complie_cmd = "mmdc -i " .. buffile .. " -o " .. outfile
    local open_cmd = "open -g -a /Applications/Skim.app/ " .. outfile

    vim.cmd("!(" .. mkdir_cmd .. " && " .. complie_cmd .. " && " .. open_cmd .. ") &")
  end,
})
