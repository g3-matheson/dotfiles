return {
  {
    "rebelot/kanagawa.nvim",
    lazy = false,
    priority = 1000,
    opts = {
      compile = false,
      theme = "wave",
      background = { dark = "wave" },
      transparent = true,
      dimInactive = false,
      commentStyle = { italic = true },
      keywordStyle = { italic = true },
      statementStyle = { bold = true },
      terminalColors = true,
    },
    config = function(_, opts)
      require("kanagawa").setup(opts)
      vim.cmd.colorscheme("kanagawa-wave")

      vim.api.nvim_create_autocmd("VimEnter", {
        callback = function()
          vim.o.numberwidth = 1
          vim.api.nvim_set_hl(0, "SignColumn", { bg = "#000000" })
          vim.api.nvim_set_hl(0, "LineNr", { bg = "#000000", fg = "#555555" })
          vim.api.nvim_set_hl(0, "CursorLineNr", { bg = "#000000", fg = "#E6C384" })
          vim.api.nvim_set_hl(0, "VertSplit", { fg = "#1a1a1a" })

          -- git signs colors
          vim.api.nvim_set_hl(0, "GitSignsAdd", { bg = "#080808", fg = "#76946A" }) -- green
          vim.api.nvim_set_hl(0, "GitSignsChange", { bg = "#080808", fg = "#DCA561" }) -- yellow/orange
          vim.api.nvim_set_hl(0, "GitSignsDelete", { bg = "#080808", fg = "#C34043" })
        end,
      })
    end,
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "kanagawa-wave",
    },
  },
}
