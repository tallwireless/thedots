vim.api.nvim_create_autocmd('FileType', { pattern = { "*.j2" },
  callback = function(ev)
      vim.treesitter.stop(ev.buff)
end
})
