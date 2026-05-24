return {
  {
    "akinsho/git-conflict.nvim",
    version = "*",
    keys = {
      { "<leader>gcl", "<cmd>GitConflictListQf<cr>", desc = "List Conflicts" },
    },
    opts = {
      default_mappings = {
        ours = "gco",
        theirs = "gct",
        both = "gcb",
        none = "gcn",
        next = "]x",
        prev = "[x",
      },
    },
  },
}
