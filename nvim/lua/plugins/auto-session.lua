return {
  "rmagatti/auto-session",
  config = function()
    require("auto-session").setup({
      auto_restore_enabled = true,
      auto_save_enabled = true,
      auto_session_suppress_dirs = nil,
      bypass_session_save_file_types = { "NvimTree", "neo-tree" },
    })
  end,
}
