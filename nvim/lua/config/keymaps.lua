-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Vertical terminal toggle (pure Neovim, no Snacks)
vim.keymap.set("n", "<leader>tv", function()
  vim.cmd("vsplit")
  vim.cmd("wincmd L")
  vim.cmd("terminal")
  vim.cmd("startinsert")
end, { desc = "Terminal (vertical right)" })
