return {
  "folke/which-key.nvim",
  opts = {
    sort = { "manual", "order", "group", "alphanum", "mod", "lower", "icase" },
    spec = {
      { "<leader>g", group = "git" },
      { "<leader>gc", group = "conflicts" },
      { "<leader>gcl", desc = "List Conflicts" },
      { "<leader>gco", desc = "Choose Ours" },
      { "<leader>gct", desc = "Choose Theirs" },
      { "<leader>gcb", desc = "Choose Both" },
      { "<leader>gcn", desc = "Choose None" },
      { "<leader>o", group = "org" },
      { "<leader>t", group = "terminals" },
    },
  },
}
