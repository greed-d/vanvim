vim.g.base46_cache = vim.fn.stdpath('data') .. '/base46_cache/'

require("greed.core")
require("greed.lazy")

dofile(vim.g.base46_cache .. "defaults")
dofile(vim.g.base46_cache .. "statusline")
dofile(vim.g.base46_cache .. "git")
dofile(vim.g.base46_cache .. "lsp")
dofile(vim.g.base46_cache .. "nvdash")
dofile(vim.g.base46_cache .. "tbline")
dofile(vim.g.base46_cache .. "treesitter")
dofile(vim.g.base46_cache .. "telescope")
dofile(vim.g.base46_cache .. "whichkey")
dofile(vim.g.base46_cache .. "cmp")
