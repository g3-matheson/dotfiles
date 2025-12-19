return {
  {
    "rebelot/kanagawa.nvim",
    lazy = false,
    config = function()
      local kanagawa = require("kanagawa")

      kanagawa.setup({
        theme = "wave",
        background = { dark = "wave" },
        transparent = true,
        dimInactive = false,
        commentStyle = { italic = true },
        keywordStyle = { italic = true },
        statementStyle = { bold = true },
        terminalColors = false,
      })

      vim.cmd("colorscheme kanagawa")

      -- Line numbers / gutter setup
      vim.o.number = true
      vim.o.relativenumber = true
      vim.o.signcolumn = "yes"

      -- Apply gutter highlights after everything is loaded
      vim.api.nvim_create_autocmd("VimEnter", {
        callback = function()
          vim.o.numberwidth = 2
          vim.api.nvim_set_hl(0, "SignColumn", { bg = "#000000" })
          vim.api.nvim_set_hl(0, "LineNr", { bg = "#000000", fg = "#555555" })
          vim.api.nvim_set_hl(0, "CursorLineNr", { bg = "#000000", fg = "#82aaff" })
          vim.api.nvim_set_hl(0, "VertSplit", { fg = "#1a1a1a" })
        end,
      })
    end,
  },
}