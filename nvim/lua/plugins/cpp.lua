return {
  {
    "stevearc/conform.nvim",
    opts = function(_, opts)
      opts.formatters_by_ft = opts.formatters_by_ft or {}

      opts.formatters_by_ft.c = { "clang-format" }
      opts.formatters_by_ft.cpp = { "clang-format" }
      opts.formatters_by_ft.cuda = { "clang-format" }
      opts.formatters_by_ft.objc = { "clang-format" }
      opts.formatters_by_ft.objcpp = { "clang-format" }
      opts.formatters_by_ft.proto = { "clang-format" }
    end,
  },

  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        clangd = {
          cmd = {
            vim.fn.filereadable(vim.fn.expand("~/dotfiles/nvim/scripts/clangd-wrapper")) == 1
              and vim.fn.expand("~/dotfiles/nvim/scripts/clangd-wrapper")
              or "clangd",
            "--background-index",
            "--clang-tidy",
            "--header-insertion=iwyu",
            "--completion-style=detailed",
            "--function-arg-placeholders=1",
            -- No --fallback-style: let .clang-format be the sole source of truth
          },
        },
      },
    },
  },
}
