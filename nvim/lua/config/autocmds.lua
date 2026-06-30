vim.api.nvim_create_autocmd("VimEnter", {
  once = true,
  callback = function()
    local arg = vim.fn.argv(0) --[[@as string]]
    if arg ~= "" and vim.fn.isdirectory(arg) == 1 then
      vim.cmd("cd " .. vim.fn.fnameescape(vim.fn.fnamemodify(arg, ":p")))
    end
  end,
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = { "text", "markdown" },
  callback = function()
    vim.opt_local.spell = false
  end,
})

vim.o.updatetime = 250
vim.cmd([[
  autocmd CursorHold * lua vim.diagnostic.open_float(nil, { focus = false })
]])

vim.api.nvim_create_autocmd("BufAdd", {
  pattern = "*.org",
  callback = function()
    require("orgmode").files:load()
  end,
})

-- turn off auto formatting for cpp and python
local no_autoformat_fts = { "c", "cpp", "cuda", "objc", "objcpp", "proto", "python", "sh", "zsh" }
vim.api.nvim_create_autocmd("FileType", {
  pattern = no_autoformat_fts,
  callback = function(ev)
    vim.b[ev.buf].autoformat = false
  end,
})
-- When autocmds.lua loads lazily (no-arg nvim start), FileType already fired
-- for session-restored buffers, so patch them retroactively.
for _, buf in ipairs(vim.api.nvim_list_bufs()) do
  if vim.api.nvim_buf_is_loaded(buf) and vim.tbl_contains(no_autoformat_fts, vim.bo[buf].filetype) then
    vim.b[buf].autoformat = false
  end
end
