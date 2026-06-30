return {
  {
    "nvim-orgmode/orgmode",
    event = "VeryLazy",
    ft = { "org" },

    dependencies = {
      "nvim-orgmode/org-bullets.nvim",
    },

    opts = {
      org_agenda_files = "~/orgfiles/**/*",
      org_default_notes_file = "~/orgfiles/refile.org",

      org_todo_keywords = {
        "TODO",
        "IN-PROGRESS",
        "IN-REVIEW",
        "|",
        "DONE",
        "CANCELED",
      },

      mappings = {
        org = {
          org_refile = false,
          org_insert_link = false,
          org_store_link = false,
        },
      },
    },

    config = function(_, opts)
      require("orgmode").setup(opts)
      require("org-bullets").setup()
      vim.lsp.enable("org")
    end,
  },

  {
    "nvim-orgmode/telescope-orgmode.nvim",
    event = "VeryLazy",
    dependencies = {
      "nvim-orgmode/orgmode",
      "folke/snacks.nvim",
    },
    config = function()
      require("telescope-orgmode").setup({ adapter = "snacks" })
    end,
    keys = {
      {
        "<leader>of",
        function()
          require("telescope-orgmode").search_headings()
        end,
        desc = "Find headings",
      },
      {
        "<leader>oT",
        function()
          require("telescope-orgmode").search_tags()
        end,
        desc = "Find tags",
      },
      {
        "<leader>or",
        function()
          require("telescope-orgmode").refile_heading()
        end,
        desc = "Refile heading",
      },
      {
        "<leader>ol",
        function()
          require("telescope-orgmode").insert_link()
        end,
        desc = "Insert link",
      },
    },
  },
}
