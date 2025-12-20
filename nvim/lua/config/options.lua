-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
vim.opt.termguicolors = true

-- line number column settings
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.signcolumn = "yes:1"
vim.opt.numberwidth = 1

vim.g.lazyvim_colorscheme = "kanagawa-wave"

vim.opt.wrap = true
vim.opt.linebreak = true
vim.opt.showbreak = "↪ "
