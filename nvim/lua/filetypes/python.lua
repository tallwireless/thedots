vim.api.nvim_create_autocmd("BufRead", {
  pattern = { "*.py" },
  callback = function()
    local set = vim.opt_local
    set.numberwidth=4
end
})
