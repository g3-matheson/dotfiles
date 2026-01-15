return {
  -- Disable F# formatters from lang.dotnet extra
  {
    "stevearc/conform.nvim",
    optional = true,
    opts = {
      formatters_by_ft = {
        fsharp = {}, -- Don't use fantomas for F#
        cs = { "csharpier" }, -- Keep csharpier for C# if you want it
      },
      formatters = {
        csharpier = {
          condition = function(self, ctx)
            return not vim.endswith(ctx.filename, ".csx")
          end,
        },
      },
    },
  },
  -- Disable F# LSP from lang.dotnet extra
  {
    "neovim/nvim-lspconfig",
    optional = true,
    opts = {
      servers = {
        fsautocomplete = false, -- Disable F# LSP
        omnisharp = {}, -- Keep C# LSP
      },
    },
  },
  -- Prevent Mason from auto-installing F# tools
  {
    "mason-org/mason.nvim",
    optional = true,
    opts = function(_, opts)
      opts.ensure_installed = opts.ensure_installed or {}
      -- Remove F# tools from auto-install
      opts.ensure_installed = vim.tbl_filter(function(tool)
        return not vim.tbl_contains({ "fsautocomplete", "fantomas" }, tool)
      end, opts.ensure_installed)
    end,
  },
}
