return
{
      "nvim-tree/nvim-tree.lua",
    cmd = { "NvimTreeToggle", "NvimTreeFocus" },
    opts = function()
      return require "greed.configs.nvimtree"
    end,
--    config = function(_, opts)
--      dofile(vim.g.base46_cache .. "nvimtree")
--      require("nvim-tree").setup(opts)
--    end,
    config = function()
      require("nvim-tree").setup()
    end
}
