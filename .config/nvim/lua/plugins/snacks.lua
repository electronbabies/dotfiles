return {
  {
    "folke/snacks.nvim",
    opts = {
      picker = {
        sources = {
          notifications = {
            win = {
              input = {
                keys = {
                  ["<c-y>"] = { "copy_notification", mode = { "n", "i" } },
                },
              },
            },
            actions = {
              copy_notification = function(_, item)
                if not item then
                  return
                end

                local value = item.data or item.text or ""
                vim.fn.setreg("+", value)
                vim.notify("Notification copied to clipboard")
              end,
            },
          },
        },
      },
    },
  },
}
