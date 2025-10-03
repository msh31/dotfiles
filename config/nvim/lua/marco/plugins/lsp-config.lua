return {
    {
        "williamboman/mason.nvim",
        opts = {}
    },
    {
        "williamboman/mason-lspconfig.nvim",
        lazy = false,
        opts = {
            ensure_installed = {
                "lua_ls",
                "csharp_ls",
                "cssls",
                "html",
                "jsonls",
                "sqlls",
                "eslint",
                "phpactor",
            },
        },
    },
    {
        "neovim/nvim-lspconfig",
        lazy = false,

        config = function()
            local capabilities = require("cmp_nvim_lsp").default_capabilities()
            local lspconfig = require("lspconfig")

            local on_attach = function(client, bufnr)
                local opts = { buffer = bufnr, silent = true }
                vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
                vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
                vim.keymap.set("n", "rn", vim.lsp.buf.rename, opts)
                vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)
            end

            -- Lua LSP with Love2D support
            lspconfig.lua_ls.setup({
                on_attach = on_attach,
                capabilities = capabilities,
                settings = {
                    Lua = {
                        runtime = {
                            version = "LuaJIT",
                        },
                        diagnostics = {
                            globals = { "vim", "love" },
                        },
                        workspace = {
                            library = {
                                [vim.fn.expand("$VIMRUNTIME/lua")] = true,
                                [vim.fn.expand("$VIMRUNTIME/lua/vim/lsp")] = true,
                                [vim.fn.stdpath("data") .. "/lazy/lazy.nvim/lua/lazy"] = true,
                            },
                            checkThirdParty = false,
                        },
                        telemetry = { enable = false },
                    },
                },
            })

            -- Other LSP servers
            lspconfig.clangd.setup({
                on_attach = function(client, bufnr)
                    client.server_capabilities.signatureHelpProvider = false
                    on_attach(client, bufnr)
                end,
                capabilities = capabilities,
            })

            lspconfig.cssls.setup({
                on_attach = on_attach,
                capabilities = capabilities,
            })

            lspconfig.html.setup({
                on_attach = on_attach,
                capabilities = capabilities,
                filetypes = { "html", "php", "blade" },
            })

            lspconfig.phpactor.setup({
                on_attach = on_attach,
                capabilities = capabilities,
                init_options = {
                    ["language_server_phpstan.enabled"] = false,
                    ["language_server_psalm.enabled"] = false,
                },
                filetypes = { "php", "html", "blade" },
            })

            lspconfig.jsonls.setup({
                on_attach = on_attach,
                capabilities = capabilities,
            })

            lspconfig.eslint.setup({
                on_attach = on_attach,
                capabilities = capabilities,
            })
        end,
    },
}
