return {
    {
        "folke/lazydev.nvim",
        ft = "lua",
        opts = {},
    },
    {
        "neovim/nvim-lspconfig",
        dependencies = {
            "RRethy/vim-illuminate",
            "williamboman/mason-lspconfig.nvim",
            {
              "williamboman/mason.nvim",
              config = true
            },
        },
        event = "BufReadPre",
        config = function()
            require("greed.configs.lspconfig")
            require("greed.configs.handlers")
        end,
    },
    {
        "folke/trouble.nvim",
        event = "LspAttach",
        opts = {
            focus = true,
            auto_open = false,
            auto_jump = false,
        },
    },
    -- code formatters
    {
        "nvimtools/none-ls.nvim",
        event = "LspAttach",
        config = function()
            local nls = require("null-ls")

            nls.setup({
                debug = false,
                sources = {
                    nls.builtins.formatting.stylua,
--                    nls.builtins.diagnostics.yamllint.with({
--                        args = require("greed.plugins.lsp-stuff.lang.yamllint"),
--                    }),
                    nls.builtins.formatting.prettierd.with({
                        disabled_filetypes = { "markdown", "yaml" },
                    }),
                },
            })
        end,
    },
    -- Lsp notifications
    {
        "j-hui/fidget.nvim",
        opts = {},
    },

}
