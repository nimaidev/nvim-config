return {
    "neovim/nvim-lspconfig",
    dependencies = {
        {
            "williamboman/mason.nvim",
            config = function()
                require("mason").setup()
            end,
        },
        {
            "williamboman/mason-lspconfig.nvim",
            config = function()
                -- Don't call setup here to avoid the automatic_enable error
                -- We'll handle LSP server installation manually
            end,
        },
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
        "hrsh7th/cmp-cmdline",
        "hrsh7th/nvim-cmp",
        "L3MON4D3/LuaSnip",
        "saadparwaiz1/cmp_luasnip",
        {
            "j-hui/fidget.nvim",
            config = function()
                require("fidget").setup({})
            end,
        },
    },

    config = function()
        local cmp_status, cmp = pcall(require, 'cmp')
        if not cmp_status then
            vim.notify("nvim-cmp not found", vim.log.levels.ERROR)
            return
        end

        local cmp_lsp_status, cmp_lsp = pcall(require, "cmp_nvim_lsp")
        if not cmp_lsp_status then
            vim.notify("cmp_nvim_lsp not found", vim.log.levels.ERROR)
            return
        end

        local lspconfig_status, lspconfig = pcall(require, "lspconfig")
        if not lspconfig_status then
            vim.notify("lspconfig not found", vim.log.levels.ERROR)
            return
        end

        local capabilities = vim.tbl_deep_extend(
            "force",
            {},
            vim.lsp.protocol.make_client_capabilities(),
            cmp_lsp.default_capabilities())

        -- Install LSP servers manually through Mason if needed
        local mason_registry_status, mason_registry = pcall(require, "mason-registry")
        if mason_registry_status then
            local servers = { 
                "lua-language-server", 
                "rust-analyzer", 
                "typescript-language-server", 
                "pyright",
                "gopls"
             }
            for _, server in ipairs(servers) do
                if not mason_registry.is_installed(server) then
                    vim.cmd("MasonInstall " .. server)
                end
            end
        end

        -- Setup LSP servers directly
        lspconfig.lua_ls.setup({
            capabilities = capabilities,
            settings = {
                Lua = {
                    diagnostics = {
                        globals = { "vim", "it", "describe", "before_each", "after_each" },
                    }
                }
            }
        })
        
        lspconfig.rust_analyzer.setup({
            capabilities = capabilities,
        })
        
        lspconfig.ts_ls.setup({
            capabilities = capabilities,
        })

        lspconfig.pyright.setup({
            capabilities = capabilities,

        })

        lspconfig.gopls.setup({
            capabilities = capabilities,
        })

        local cmp_select = { behavior = cmp.SelectBehavior.Select }

        cmp.setup({
            snippet = {
                expand = function(args)
                    local luasnip_status, luasnip = pcall(require, 'luasnip')
                    if luasnip_status then
                        luasnip.lsp_expand(args.body)
                    end
                end,
            },
            mapping = cmp.mapping.preset.insert({
                ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
                ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
                ['<C-y>'] = cmp.mapping.confirm({ select = true }),
                ["<C-Space>"] = cmp.mapping.complete(),
            }),
            sources = cmp.config.sources({
                { name = 'nvim_lsp' },
                { name = 'luasnip' },
            }, {
                { name = 'buffer' },
            })
        })

        vim.diagnostic.config({
            -- update_in_insert = true,
            float = {
                focusable = false,
                style = "minimal",
                border = "rounded",
                source = "always",
                header = "",
                prefix = "",
            },
        })
    end
}