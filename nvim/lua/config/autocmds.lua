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

-- turn off auto formatting for cpp
local cpp_fts = { "c", "cpp", "cuda", "objc", "objcpp", "proto" }
vim.api.nvim_create_autocmd("FileType", {
  pattern = cpp_fts,
  callback = function(ev)
    vim.b[ev.buf].autoformat = false
  end,
})
-- When autocmds.lua loads lazily (no-arg nvim start), FileType already fired
-- for session-restored buffers, so patch them retroactively.
for _, buf in ipairs(vim.api.nvim_list_bufs()) do
  if vim.api.nvim_buf_is_loaded(buf) and vim.tbl_contains(cpp_fts, vim.bo[buf].filetype) then
    vim.b[buf].autoformat = false
  end
end
