return {
  {
    "mg979/vim-visual-multi",
    lazy = false,
    keys = {
      { "<C-j>", mode = { "n", "v" } },
      { "<C-k>", mode = { "n", "v" } },
    },
    init = function()
      vim.g.VM_maps = {
        ["Add Cursor Down"] = "<C-j>",
        ["Add Cursor Up"] = "<C-k>",
        ["Undo"] = "u",
        ["Redo"] = "<C-r>",
        ["Goto Next"] = "}",
        ["Goto Prev"] = "{",
      }
    end,
  },
}
