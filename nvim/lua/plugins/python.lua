return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        -- pylsp disabled: lazyvim.plugins.extras.lang.python provides pyright,
        -- and having both causes duplicate goto-definition results.
        pylsp = { mason = false, enabled = false },
      },
    },
  },
  {
    "mfussenegger/nvim-lint",
    opts = {
      linters_by_ft = {
        python = {},
      },
    },
  },
  {
    -- ruff LSP crashes on textDocument/rangeFormatting ("assertion failed: start.raw <= end.raw").
    -- Using the CLI formatter instead; range_args disabled so ruff formats the whole file,
    -- and conform applies only the diff within the visual selection.
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        python = { "ruff_format" },
      },
      formatters = {
        ruff_format = { range_args = false },
      },
    },
  },
}
