local lspconfig = require("lspconfig")
local mason_lspconfig = require("mason-lspconfig")

--local lang = require("greed.plugins.lspstuff.lang")
local opts = require("greed.configs.lspopts")

local servers = {
    -- prismals = {},
    lua_ls = {},
    yamlls = {},
    rust_analyzer = {},
    jdtls = {},
    html = {},
    bashls = {},
    pylsp = {},
    clangd = {},
    marksman = {},
    emmet_ls = {},
}

mason_lspconfig.setup({
    ensure_installed = vim.tbl_keys(servers),
})

mason_lspconfig.setup_handlers({
    function(server_name)
        lspconfig[server_name].setup({
            on_attach = opts.on_attach,
            capabilities = opts.capabilities,
            settings = servers[server_name],
            filetypes = (servers[server_name] or {}).filetypes,
        })
    end,
})

-- lspconfig.clangd.setup({
--     on_attach = opts.on_attach,
--     capabilities = opts.capabilities,
--     cmd = {
--         "clangd",
--         "--offset-encoding=utf-16",
--     },
-- })
