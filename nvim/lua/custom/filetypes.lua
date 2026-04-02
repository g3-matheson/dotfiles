vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  pattern = "*.tpp",
  callback = function()
    vim.bo.filetype = "cpp" -- treat .tpp as C++
  end,
})

-- Recognize .tpp files as C++
vim.filetype.add({
  extension = {
    tpp = "cpp",
  },
})

vim.filetype.add({
  extension = {
    usda = "usda",
    usd = "usda",
  },
})
