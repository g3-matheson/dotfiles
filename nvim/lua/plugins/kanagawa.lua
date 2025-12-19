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
      
      -- Force terminal colors
      vim.g.terminal_color_0 = "#16161D"
      vim.g.terminal_color_1 = "#C34043"
      vim.g.terminal_color_2 = "#76946A"
      vim.g.terminal_color_3 = "#C0A36E"
      vim.g.terminal_color_4 = "#7E9CD8"
      vim.g.terminal_color_5 = "#957FB8"
      vim.g.terminal_color_6 = "#6A9589"
      vim.g.terminal_color_7 = "#DCD7BA"
      vim.g.terminal_color_8 = "#727169"
      vim.g.terminal_color_9 = "#E82424"
      vim.g.terminal_color_10 = "#98BB6C"
      vim.g.terminal_color_11 = "#E6C384"
      vim.g.terminal_color_12 = "#7FB4CA"
      vim.g.terminal_color_13 = "#938AA9"
      vim.g.terminal_color_14 = "#7AA89F"
      vim.g.terminal_color_15 = "#C8C093"
      
      -- Clear all terminal window highlights
      local function clear_all_terminal_winhighlights()
        for _, win in ipairs(vim.api.nvim_list_wins()) do
          if vim.api.nvim_win_is_valid(win) then
            local buf = vim.api.nvim_win_get_buf(win)
            local bufname = vim.api.nvim_buf_get_name(buf)
            if bufname:match("^term://") then
              pcall(vim.api.nvim_win_set_option, win, "winhighlight", "")
            end
          end
        end
      end
      
      -- Clear winhighlight on terminal windows to prevent snacks override
      vim.api.nvim_create_autocmd({
        "TermOpen", "TermEnter", "WinEnter", "BufWinEnter", 
        "BufEnter", "WinResized", "VimResized", "FocusGained"
      }, {
        pattern = "term://*",
        callback = function()
          vim.schedule(function()
            clear_all_terminal_winhighlights()
          end)
        end,
      })
      
      vim.api.nvim_create_autocmd("VimEnter", {
        callback = function()
          vim.o.numberwidth = 2
          vim.api.nvim_set_hl(0, "SignColumn", { bg = "#000000" })
          vim.api.nvim_set_hl(0, "LineNr", { bg = "#000000", fg = "#555555" })
          vim.api.nvim_set_hl(0, "CursorLineNr", { bg = "#000000", fg = "#E6C384" })
          vim.api.nvim_set_hl(0, "VertSplit", { fg = "#1a1a1a" })
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