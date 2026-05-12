return {
  {
    "mg979/vim-visual-multi",
    lazy = false,
    keys = {
      { "<M-j>", mode = { "n", "v" } },
      { "<M-k>", mode = { "n", "v" } },
    },
    init = function()
      vim.g.VM_maps = {
        ["Add Cursor Down"] = "<M-j>",
        ["Add Cursor Up"] = "<M-k>",
        ["Undo"] = "u",
        ["Redo"] = "<M-r>",
        ["Goto Next"] = "}",
        ["Goto Prev"] = "{",
      }
    end,
  },
}
