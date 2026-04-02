return {
  "nvim-neo-tree/neo-tree.nvim",
  opts = {
    window = {
      width = 25,
    },
    filesystem = {
      filtered_items = {
        --visible = true, -- Show hidden files by default
        hide_dotfiles = false,
        hide_gitignored = false,
        hide_by_name = {
          ".git",
        },
        hide_by_pattern = { "[0-9]", "[0-9][0-9]", "[0-9][ab]", "[0-9][0-9][ab]" },
      },
    },
  },
}
