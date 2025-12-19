return {
  {
    "nvim-lualine/lualine.nvim",
    opts = function(_, opts)
      local kanagawa_colors = require("kanagawa.colors").setup()
      local palette = kanagawa_colors.palette
      
      opts.options = opts.options or {}
      opts.options.theme = {
        normal = {
          a = { bg = palette.crystalBlue, fg = "#000000", gui = "bold" },
          b = { bg = "#000000", fg = palette.fujiWhite },
          c = { bg = "#000000", fg = palette.fujiGray },
        },
        insert = {
          a = { bg = palette.autumnGreen, fg = "#000000", gui = "bold" },
          b = { bg = "#000000", fg = palette.fujiWhite },
          c = { bg = "#000000", fg = palette.fujiGray },
        },
        visual = {
          a = { bg = palette.oniViolet, fg = "#000000", gui = "bold" },
          b = { bg = "#000000", fg = palette.fujiWhite },
          c = { bg = "#000000", fg = palette.fujiGray },
        },
        replace = {
          a = { bg = palette.autumnRed, fg = "#000000", gui = "bold" },
          b = { bg = "#000000", fg = palette.fujiWhite },
          c = { bg = "#000000", fg = palette.fujiGray },
        },
        command = {
          a = { bg = palette.boatYellow2, fg = "#000000", gui = "bold" },
          b = { bg = "#000000", fg = palette.fujiWhite },
          c = { bg = "#000000", fg = palette.fujiGray },
        },
        inactive = {
          a = { bg = "#000000", fg = palette.fujiGray },
          b = { bg = "#000000", fg = palette.fujiGray },
          c = { bg = "#000000", fg = palette.fujiGray },
        },
      }
      
      return opts
    end,
  },
}