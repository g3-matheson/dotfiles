return {
  {
    "folke/snacks.nvim",
    opts = {
      indent = { enabled = false },
      picker = {
        formatters = {
          file = {
            min_width = 40,
            filename_first = true,
          },
        },
        sources = {
          grep = {
            format = function(item, picker)
              local pos = item.pos
              item.pos = nil
              local result = require("snacks.picker.format").file(item, picker)
              item.pos = pos
              return result
            end,
          },
        },
      },
      terminal = {
        win = {
          style = nil,
          backdrop = false,
          wo = {
            winhighlight = "",
          },
        },
      },
    },
  },
}
