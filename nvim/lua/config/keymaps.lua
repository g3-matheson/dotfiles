-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Vertical terminal toggle (pure Neovim, no Snacks)
vim.keymap.set("n", "<leader>tv", function()
  vim.cmd("vsplit")
  -- vim.cmd("wincmd L")
  vim.cmd("terminal")
  vim.cmd("startinsert")
end, { desc = "Terminal (vertical right)" })

-- Horizontal terminal toggle (pure Neovim, no Snacks)
vim.keymap.set("n", "<leader>th", function()
  vim.cmd("split")
  vim.cmd("terminal")
  vim.cmd("startinsert")
end, { desc = "Terminal (horizontal bottom)" })

-- Window navigation
vim.keymap.set("n", "<C-Up>", "<C-w>k", { desc = "Go to upper window" })
vim.keymap.set("n", "<C-Down>", "<C-w>j", { desc = "Go to lower window" })

-- swap $ and ^ for intuitive navigation
vim.keymap.set({ "n", "v", "o" }, "$", "^", { desc = "Go to first non-blank character" })
vim.keymap.set({ "n", "v", "o" }, "^", "$", { desc = "Go to end of line" })
