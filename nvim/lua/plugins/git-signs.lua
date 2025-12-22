return {
  "lewis6991/gitsigns.nvim",
  opts = {
    signs = {
      -- usable icons:
      --    󰜺 󰃢      󰯙 󰜥 ♥  󰇾  󰓛 󰆕  󰐃     󰿶   󰙂 󰿦 󱝊 󰈸  󰱥 󰆖 󱐋        󰈻 󰼠 󰋠
      --     󱓇 󰑀 󰑂 󰑅 󰝤 󰞋   󰓡 
      -- 󱪼 󱪽 󱪾 󱪿 󱤩 󰒆 󰾂 󰒇   󰜅 󰨓 f 󰀧 󰨔 󱖢  █
      add = { text = "󰿶" },
      change = { text = "󰜥" },
      delete = { text = "" },
      topdelete = { text = "" },
      changedelete = { text = "" },
    },
    signs_staged_enable = true, -- Show staged changes
    signs_staged = {
      add = { text = "┃" },
      change = { text = "┃" },
      delete = { text = "┃" },
      topdelete = { text = "▔" },
      changedelete = { text = "┃" },
    },
  },
}
