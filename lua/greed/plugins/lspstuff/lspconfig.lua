  return {
    "neovim/nvim-lspconfig",
    event = "User FilePost",
    config = function()
      require("greed.configs.lspconfig").defaults()
    end,
  }
