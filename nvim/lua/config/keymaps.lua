-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Vertical terminal toggle (pure Neovim, no Snacks)
vim.keymap.set("n", "<leader>tv", function()
  vim.cmd("vsplit")
  vim.cmd("lcd " .. vim.fn.fnameescape(LazyVim.root()))
  vim.cmd("terminal")
  vim.cmd("startinsert")
end, { desc = "Terminal (vertical right)" })

-- Horizontal terminal toggle (pure Neovim, no Snacks)
vim.keymap.set("n", "<leader>th", function()
  vim.cmd("split")
  vim.cmd("resize 15")
  vim.cmd("lcd " .. vim.fn.fnameescape(LazyVim.root()))
  vim.cmd("terminal")
  vim.cmd("startinsert")
end, { desc = "Terminal (horizontal bottom)" })

-- Window navigation
-- override terminal "lock-in" and still use Ctrl-based navigation
vim.keymap.set("t", "<C-h>", [[<Cmd>wincmd h<CR>]])
vim.keymap.set("t", "<C-j>", [[<Cmd>wincmd j<CR>]])
vim.keymap.set("t", "<C-k>", [[<Cmd>wincmd k<CR>]])
vim.keymap.set("t", "<C-l>", [[<Cmd>wincmd l<CR>]])
vim.keymap.set("n", "<C-Up>", "<C-w>k", { desc = "Go to upper window" })
vim.keymap.set("n", "<C-Down>", "<C-w>j", { desc = "Go to lower window" })

-- swap $ and ^ for intuitive navigation
-- removing these since they correspond to regex key chars and i might get confused
--vim.keymap.set({ "n", "v", "o" }, "$", "^", { desc = "Go to first non-blank character" })
--vim.keymap.set({ "n", "v", "o" }, "^", "$", { desc = "Go to end of line" })

-- git diff picker: explicitly resolve the git root at call time so the picker
-- works from the dashboard or any window not local-cd'd into the repo
vim.keymap.set("n", "<leader>gd", function()
  Snacks.picker.git_diff({ cwd = Snacks.git.get_root(0) or vim.fn.getcwd() })
end, { desc = "Git Diff (hunks)" })

vim.keymap.set("n", "<leader>gD", function()
  Snacks.picker.git_diff({ cwd = Snacks.git.get_root(0) or vim.fn.getcwd(), base = "origin", group = true })
end, { desc = "Git Diff (origin)" })

-- git clang-format
vim.keymap.set("n", "<leader>cg", function()
  vim.cmd("write")

  vim.fn.system({
    "git",
    "clang-format",
    "--quiet",
    "HEAD",
  })

  vim.cmd("edit!")
end, { desc = "Git clang-format" })

-- format visual selection
vim.keymap.set("x", "<leader>cf", function()
  require("conform").format({
    range = {
      start = { vim.fn.line("v"), 0 },
      ["end"] = { vim.fn.line("."), -1 },
    },
  })
end, { desc = "Format selection" })
