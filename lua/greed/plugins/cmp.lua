return {
    "hrsh7th/nvim-cmp",
    event = "LspAttach",
    dependencies = {
        "saadparwaiz1/cmp_luasnip",
        "hrsh7th/cmp-nvim-lsp-signature-help",
        "hrsh7th/cmp-nvim-lsp",
        {
          "L3MON4D3/LuaSnip",
          dependencies = { "rafamadriz/friendly-snippets" },
          config = function(_, opts)
          if opts then require("luasnip").config.setup(opts) end
          vim.tbl_map(
            function(type) require("luasnip.loaders.from_" .. type).lazy_load() end,
            { "vscode", "snipmate", "lua" }
          )
          -- friendly-snippets - enable standardized comments snippets
          require("luasnip").filetype_extend("typescript", { "tsdoc" })
          require("luasnip").filetype_extend("javascript", { "jsdoc" })
          require("luasnip").filetype_extend("lua", { "luadoc" })
          require("luasnip").filetype_extend("python", { "pydoc" })
          require("luasnip").filetype_extend("rust", { "rustdoc" })
          require("luasnip").filetype_extend("cs", { "csharpdoc" })
          require("luasnip").filetype_extend("java", { "javadoc" })
          require("luasnip").filetype_extend("c", { "cdoc" })
          require("luasnip").filetype_extend("cpp", { "cppdoc" })
          require("luasnip").filetype_extend("php", { "phpdoc" })
          require("luasnip").filetype_extend("kotlin", { "kdoc" })
          require("luasnip").filetype_extend("ruby", { "rdoc" })
          require("luasnip").filetype_extend("sh", { "shelldoc" })
  end,
        },
    },
    config = function()
        local cmp = require("cmp")
        local luasnip = require("luasnip")

        local kind_icons = {
          Text = "󰉿",
          Method = "󰆧",
          Function = "󰊕",
          Constructor = "",
          Field = "󰜢",
          Variable = "󰀫",
          Class = "󰠱",
          Interface = "",
          Module = "",
          Property = "󰜢",
          Unit = "󰑭",
          Value = "󰎠",
          Enum = "",
          Keyword = "󰌋",
          Snippet = "",
          Color = "󰏘",
          File = "󰈙",
          Reference = "󰈇",
          Folder = "󰉋",
          EnumMember = "",
          Constant = "󰏿",
          Struct = "󰙅",
          Event = "",
          Operator = "󰆕",
          TypeParameter = "",
        }

        local borderstyle = {
            border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
            winhighlight = "Normal:CmpPmenu,CursorLine:PmenuSel,Search:None",
        }
        ---@diagnostic disable
        cmp.setup({
            completion = { completeopt = 'menu,menuone,noinsert' },
            snippet = {
                expand = function(args)
                    luasnip.lsp_expand(args.body)
                end,
            },
            mapping = cmp.mapping.preset.insert({
              ["<C-p>"] = cmp.mapping.select_prev_item(),
              ["<C-n>"] = cmp.mapping.select_next_item(),
              ["<C-d>"] = cmp.mapping.scroll_docs(-4),
              ["<C-f>"] = cmp.mapping.scroll_docs(4),
              ["<C-Space>"] = cmp.mapping.complete(),
              ["<C-e>"] = cmp.mapping.close(),

              ["<CR>"] = cmp.mapping.confirm {
                behavior = cmp.ConfirmBehavior.Insert,
                select = true,
              },

              ["<Tab>"] = cmp.mapping(function(fallback)
                if cmp.visible() then
                  cmp.select_next_item()
                elseif require("luasnip").expand_or_jumpable() then
                  vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<Plug>luasnip-expand-or-jump", true, true, true), "")
                else
                  fallback()
                end
              end, { "i", "s" }),

              ["<S-Tab>"] = cmp.mapping(function(fallback)
                if cmp.visible() then
                  cmp.select_prev_item()
                elseif require("luasnip").jumpable(-1) then
                  vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<Plug>luasnip-jump-prev", true, true, true), "")
                else
                  fallback()
                end
              end, { "i", "s" }),
            }),
            formatting = {
                fields = { "abbr", "kind", "menu" },
                format = function(entry, vim_item)
                    vim_item.menu = ({
                        nvim_lsp = "[LSP]",
                        luasnip = "[Snip]",
                        buffer = "[Buff]",
                        path = "[Path]",
                    })[entry.source.name]

                    -- for codeium
                    -- if vim_item.kind == "Codeium" then
                    --     vim_item.menu = "[󱚤 ]"
                    --     vim_item.kind = " "
                    --     return vim_item
                    -- end

                    vim_item.kind = string.format("%s", kind_icons[vim_item.kind])
                    return vim_item
                end,
            },
            sources = cmp.config.sources({
                { name = "nvim_lsp" },
                { name = "codeium" },
                { name = "nvim_lsp_signature_help" },
                { name = "luasnip" },
                { name = "path" },
            }, {
                { name = "buffer" },
            }),
            duplicates = {
                nvim_lsp = 1,
                luasnip = 1,
                buffer = 1,
                path = 1,
            },
            window = {
                completion = borderstyle,
                documentation = borderstyle,
            },
            experimental = {
                ghost_text = false,
                native_menu = false,
            },
        })

        -- Setup up vim-dadbod
        cmp.setup.filetype({ "sql" }, {
            sources = {
                { name = "vim-dadbod-completion" },
                { name = "buffer" },
            },
        })

        require("luasnip/loaders/from_vscode").lazy_load({
            paths = vim.fn.stdpath("config") .. "/snippets",
        })
    end,
}
