return {
  "MeanderingProgrammer/render-markdown.nvim",
  dependencies = { "nvim-treesitter/nvim-treesitter" },
  ---@module 'render-markdown'
  ---@type render.md.UserConfig
  opts = {
    completions = { lsp = { enabled = true } },
  },
  init = function()
    vim.api.nvim_create_autocmd("BufWritePre", {
      pattern = "*.md",
      callback = function()
        vim.cmd("%s/\\s\\+$//e")
      end,
    })
  end,
}
