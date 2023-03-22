return {
  {
    "nvim-telescope/telescope.nvim",
    cmd = "Telescope",
    dependencies = {
      "nvim-telescope/telescope-file-browser.nvim",
      "nvim-telescope/telescope-frecency.nvim",
    },
    opts = {
      defaults = {
        initial_mode = "normal",
        mappings = {
          i = {
            ["jj"] = { "<Esc>", type = "command" },
          },
        },
        layout_config = {
          prompt_position = "top",
        },
        sorting_strategy = "ascending",
      },
      extensions = {
        file_browser = {},
      },
    },
    keys = {
      { "<leader>bf", "<cmd>Telescope buffers<cr>", desc = "Buffers" },
      { "<leader>ff", "<cmd>Telescope frecency<cr>", desc = "Find Files (frecency)" },
      { "<leader>fb", "<cmd>Telescope file_browser<cr>", desc = "File browser" },
    },
  },

  {
    "nvim-telescope/telescope-file-browser.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    config = function()
      local fb_actions = require("telescope._extensions.file_browser.actions")
      require("telescope").setup({
        extensions = {
          file_browser = {
            mappings = {
              ["n"] = {
                ["c"] = fb_actions.create,
                ["r"] = fb_actions.rename,
                ["d"] = fb_actions.move,
                ["y"] = fb_actions.copy,
                ["X"] = fb_actions.remove,
                ["h"] = fb_actions.goto_parent_dir,
                ["~"] = fb_actions.goto_home_dir,
                ["w"] = fb_actions.goto_cwd,
                ["cd"] = fb_actions.change_cwd,
                ["H"] = fb_actions.toggle_hidden,
              },
            },
          },
        },
      })

      require("telescope").load_extension("file_browser")
    end,
  },

  {
    "nvim-telescope/telescope-frecency.nvim",
    dependencies = {
      "kkharji/sqlite.lua",
    },
    config = function()
      require("telescope").load_extension("frecency")
    end,
  },
}
