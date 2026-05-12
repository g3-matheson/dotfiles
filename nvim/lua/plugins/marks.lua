return {
  "chentoast/marks.nvim",
  event = "VeryLazy",
  opts = {
    default_mappings = true,
    builtin_marks = { ".", "<", ">", "^" },
    cyclic = true,
    force_write_shada = false,
    refresh_interval = 250,
    sign_priority = { lower = 10, upper = 15, builtin = 8, bookmark = 20 },
    excluded_filetypes = {
      "neo-tree",
      "snacks_dashboard",
      "snacks_picker_list",
      "lazy",
      "mason",
      "TelescopePrompt",
      "help",
      "qf",
    },
    bookmark_0 = { sign = "⚑", virt_text = "todo", annotate = false },
    mappings = {
      set_next = "m,",
      toggle = "m;",
      next = "m]",
      prev = "m[",
      preview = "m:",
      delete_line = "dm-",
      delete_buf = "dm<space>",
      set_bookmark0 = "m0",
      delete_bookmark0 = "dm0",
      next_bookmark = "m}",
      prev_bookmark = "m{",
      annotate = "m<space>",
    },
  },
  keys = {
    {
      "<leader>sm",
      function()
        Snacks.picker.marks({
          title = "Marks",
          transform = function(item)
            return item.label:match("[a-zA-Z]") and item or false
          end,
        })
      end,
      desc = "Marks",
    },

    {
      "<leader>sb",
      function()
        Snacks.picker.marks({
          title = "Bookmarks",
          transform = function(item)
            return item.label:match("%d") and item or false
          end,
        })
      end,
      desc = "Bookmarks",
    },
  },
}
