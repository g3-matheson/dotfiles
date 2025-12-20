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
      -- Add visual-multi status to lualine
      opts.sections = opts.sections or {}
      opts.sections.lualine_x = opts.sections.lualine_x or {}

      -- Insert VM status at the beginning of lualine_x
      table.insert(opts.sections.lualine_x, 1, {
        function()
          -- Check if VM is active
          if vim.b.visual_multi then
            local vm_info = vim.fn["VMInfos"]()
            if vm_info and vm_info.status then
              return "VM: " .. vm_info.status
            end
          end
          return ""
        end,
        color = { fg = palette.oniViolet, gui = "bold" },
        cond = function()
          return vim.b.visual_multi ~= nil
        end,
      })

      return opts
    end,
    init = function()
      -- Disable VM's own statusline to prevent conflicts
      vim.g.VM_set_statusline = 0
      vim.g.VM_silent_exit = 1
    end,
  },
}
