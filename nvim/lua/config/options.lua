-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

local opt = vim.opt

opt.completeopt = "menu,menuone,noselect"
opt.autowrite = false
opt.scrolloff = 3
opt.relativenumber = false
opt.shiftwidth = 4
opt.tabstop = 4
opt.wrap = true

opt.fileformats = "unix"
opt.linebreak = true
opt.showbreak = [[﬌ ]]
opt.autochdir = true

-- diagnostics setting
vim.diagnostic.config({ virtual_text = false })
vim.lsp.handlers["textDocument/publishDiagnostics"] =
  vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, { virtual_text = false })

-- you will likely want to reduce updatetime which affects cursorhold
-- note: this setting is global and should be set only once
vim.o.updatetime = 250
vim.cmd([[autocmd cursorhold * lua vim.diagnostic.open_float(nil, {focus=false, scope="cursor"})]])
