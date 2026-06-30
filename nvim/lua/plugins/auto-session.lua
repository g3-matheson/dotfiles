return {
  "rmagatti/auto-session",
  config = function()
    local launch_cwd = vim.fn.getcwd()

    require("auto-session").setup({
      auto_restore_enabled = true,
      auto_save_enabled = true,
      auto_session_suppress_dirs = nil,
      bypass_session_save_file_types = { "NvimTree", "neo-tree" },
      post_restore_cmds = {
        function()
          -- Session restores its saved cwd; reset to where nvim was actually launched from
          vim.cmd("cd " .. vim.fn.fnameescape(launch_cwd))
        end,
        function()
          -- redetect filetype for all buffers after session restore
          for _, buf in ipairs(vim.api.nvim_list_bufs()) do
            if vim.api.nvim_buf_is_loaded(buf) and vim.bo[buf].filetype == "" then
              local name = vim.api.nvim_buf_get_name(buf)
              vim.bo[buf].filetype = vim.filetype.match({ filename = name, buf = buf }) or ""
            end
          end
        end,
      },
    })
  end,
}
