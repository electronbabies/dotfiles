return {
  {
    "m4xshen/hardtime.nvim",
    lazy = false,
    dependencies = { "MunifTanjim/nui.nvim" },
    keys = {
      {
        "<leader>th",
        "<cmd>Hardtime toggle<CR>",
        desc = "Toggle Hardtime",
      },
    },
    opts = {
      max_time = 1000,
      max_count = 4,
      hint = true,
      notification = true,
      timeout = 6000,
      allow_different_key = true,
      restriction_mode = "hint",
      disabled_keys = {
        ["<Up>"] = {},
        ["<Down>"] = {},
        ["<Left>"] = {},
        ["<Right>"] = {},
      },
      disabled_filetypes = {
        lazy = true,
        mason = true,
        help = true,
        qf = true,
        checkhealth = true,
        lspinfo = true,
        man = true,
        ["dapui*"] = true,
      },
      hints = {
        ["jjj"] = {
          message = function()
            return "Try a count like 5j, /search, n/N, or Ctrl-d/Ctrl-u instead of repeated j"
          end,
          length = 3,
        },
        ["kkk"] = {
          message = function()
            return "Try a count like 5k, ?search, n/N, or Ctrl-d/Ctrl-u instead of repeated k"
          end,
          length = 3,
        },
        ["llll"] = {
          message = function()
            return "Use w/e/f/t/; instead of walking right one key at a time"
          end,
          length = 4,
        },
        ["hhhh"] = {
          message = function()
            return "Use b/F/T/, instead of walking left one key at a time"
          end,
          length = 4,
        },
        ["www"] = {
          message = function()
            return "Try f/F/t/T, /search, or a text object if you are jumping within a small area"
          end,
          length = 3,
        },
        ["bbb"] = {
          message = function()
            return "Try F/T, ?search, or a text object if you are jumping backward within a small area"
          end,
          length = 3,
        },
        ["vjjj"] = {
          message = function()
            return "Use V, a count, /search, or a text object instead of line-by-line visual selection"
          end,
          length = 4,
        },
      },
    },
  },
}
