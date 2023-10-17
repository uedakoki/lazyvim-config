local function split(str, pattern, n)
  if not string.find(str, pattern) then
    -- 分割キーワードが存在しない場合、文字列を分割せず、配列として返します。
    return { str }
  end
  local result = {}
  local fpat = "(.-)" .. pattern
  local insertCnt = 1
  local lastEnd = 1
  local s, e, cap = string.find(str, fpat, 1)
  while s do
    if insertCnt > n and n > 0 then
      break
    end
    if s ~= 1 or cap ~= "" then
      table.insert(result, cap)
    end
    insertCnt = insertCnt + 1
    lastEnd = e + 1
    s, e, cap = string.find(str, fpat, lastEnd)
  end
  if lastEnd <= #str then
    cap = string.sub(str, lastEnd)
    table.insert(result, cap)
  end
  return result
end

local function value_in_table(value, tbl)
  for _, v in ipairs(tbl) do
    if v == value then
      return true
    end
  end
  return false
end

local Path = require("plenary.path")
local enabled_projects = split(vim.fn.getenv("COPILOT_ENABLED_PROJECTS") or "", ":", 0)
local enabled_filetypes = {
  "python",
  "javascript",
  "lua",
  "shell",
  "bash",
  "zsh",
}

local function check_and_toggle_copilot()
  if not value_in_table(vim.bo.filetype, enabled_filetypes) then
    vim.cmd("Copilot disable")
    vim.cmd("Copilot status")
    return
  end

  local current_buf_path = vim.fn.expand("%:p")
  local buf_parents = Path:new(current_buf_path):parents()
  table.insert(buf_parents, 1, current_buf_path)

  for _, parent in ipairs(buf_parents) do
    for _, project in ipairs(enabled_projects) do
      local project_path = Path:new(project)
      if parent == project_path.filename then
        vim.cmd("Copilot enable")
        vim.cmd("Copilot status")
        return
      end
    end
  end
  vim.cmd("Copilot disable")
  vim.cmd("Copilot status")
end

local function augroup(name)
  return vim.api.nvim_create_augroup("lazyvim_" .. name, { clear = true })
end
vim.api.nvim_create_autocmd({ "BufEnter" }, {
  group = augroup("disable_copilot"),
  pattern = { "*" },
  callback = function()
    check_and_toggle_copilot()
  end,
})

return {
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "VeryLazy",
    build = ":Copilot auth",
    opts = function()
      local enabled = true
      local filetypes = { ["*"] = false }
      for _, ft in ipairs(enabled_filetypes) do
        filetypes[ft] = enabled
      end
      return {
        suggestion = { enabled = enabled },
        panel = { enabled = enabled },
        filetypes = filetypes,
      }
    end,
  },
  {
    "zbirenbaum/copilot-cmp",
    dependencies = "copilot.lua",
    opts = {},
    config = function(_, opts)
      local copilot_cmp = require("copilot_cmp")
      copilot_cmp.setup(opts)
      -- attach cmp source whenever copilot attaches
      -- fixes lazy-loading issues with the copilot cmp source
      require("lazyvim.util").lsp.on_attach(function(client)
        if client.name == "copilot" then
          copilot_cmp._on_insert_enter({})
        end
      end)
    end,
  },
}
