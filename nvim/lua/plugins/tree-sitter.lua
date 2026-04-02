return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    opts = {
      ensure_installed = { "usd" },
      highlight = { enable = true },
    },
  },
  {
    "ColinKennedy/tree-sitter-usd",
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    config = function()
      vim.treesitter.language.register("usd", "usda")

      vim.api.nvim_create_autocmd("FileType", {
        pattern = "usda",
        callback = function()
          vim.treesitter.start()
        end,
      })
    end,
  },
}
