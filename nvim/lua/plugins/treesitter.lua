return {
  "nvim-treesitter/nvim-treesitter",
  dependencies = {
    {
      "nvim-treesitter/nvim-treesitter-textobjects",
      init = function()
        -- PERF: no need to load the plugin, if we only need its queries for mini.ai
        local plugin = require("lazy.core.config").spec.plugins["nvim-treesitter"]
        local opts = require("lazy.core.plugin").values(plugin, "opts", false)
        local enabled = false
        if opts.textobjects then
          for _, mod in ipairs({ "move", "select", "swap", "lsp_interop" }) do
            if opts.textobjects[mod] and opts.textobjects[mod].enable then
              enabled = true
              break
            end
          end
        end
        if not enabled then
          require("lazy.core.loader").disable_rtp_plugin("nvim-treesitter-textobjects")
        end
      end,
    },
    {
      "HiPhish/nvim-ts-rainbow2",
      config = function()
        require("nvim-treesitter.configs").setup({
          rainbow = {
            enable = true,
            -- list of languages you want to disable the plugin for
            -- disable = { "jsx", "cpp" },
            disable = { "html" },
            -- Which query to use for finding delimiters
            query = "rainbow-parens",
            -- Highlight the entire buffer all at once
            strategy = require("ts-rainbow").strategy.global,
          },
        })
      end,
    },
    {
      "yioneko/nvim-yati",
      config = function()
        require("nvim-treesitter.configs").setup({
          yati = {
            enable = true,
            -- Disable by languages, see `Supported languages`
            disable = { "python" },

            -- Whether to enable lazy mode (recommend to enable this if bad indent happens frequently)
            default_lazy = true,

            -- Determine the fallback method used when we cannot calculate indent by tree-sitter
            --   "auto": fallback to vim auto indent
            --   "asis": use current indent as-is
            --   "cindent": see `:h cindent()`
            -- Or a custom function return the final indent result.
            default_fallback = "auto",
          },
          indent = {
            enable = false, -- disable builtin indent module
          },
        })
      end,
    },
  },
  ---@type TSConfig
  opts = {
    highlight = { enable = true },
    indent = {
      enable = false,
    },
    context_commentstring = { enable = true, enable_autocmd = false },
    ensure_installed = {
      "bash",
      "c",
      "cpp",
      "html",
      "javascript",
      "json",
      "lua",
      "luadoc",
      "luap",
      "markdown",
      "markdown_inline",
      "python",
      "query",
      "regex",
      "tsx",
      "typescript",
      "vim",
      "vimdoc",
      "yaml",
    },
    incremental_selection = {
      enable = true,
      keymaps = {
        init_selection = "<C-space>",
        node_incremental = "<C-space>",
        scope_incremental = "<nop>",
        node_decremental = "<bs>",
      },
    },
  },
}
