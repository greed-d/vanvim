local autocmd = vim.api.nvim_create_autocmd

-------------------------------------- highlight on yanked ------------------------------------------

autocmd("TextYankPost", {
  pattern = "*",
  callback = function()
    vim.highlight.on_yank {
      higroup = "IncSearch",
      timeout = 100,
    }
  end,
})

