return {
    {
        "williamboman/mason.nvim",
        build = ":MasonUpdate",
        opts = {},
    },

    {
        "williamboman/mason-lspconfig.nvim",
        dependencies = { "williamboman/mason.nvim" },
        opts = {
            ensure_installed = {
                "pyright",   -- Python
                "lua_ls",    -- Lua
                "bashls",    -- Bash
                "clangd",    -- C / C++
            },
            automatic_installation = true,
        },
    },

    {
        "WhoIsSethDaniel/mason-tool-installer.nvim",
        dependencies = { "williamboman/mason.nvim" },
        opts = {
            ensure_installed = {
                "black",        -- Python formatter
                -- stylua installed system-wide via pacman
                "shfmt",        -- Bash formatter
                "clang-format", -- C / C++ formatter
            },
        },
    },

    {
        "neovim/nvim-lspconfig",
        dependencies = { "williamboman/mason-lspconfig.nvim" },
        config = function()

            -- Keymaps applied when LSP attaches to a buffer
            vim.api.nvim_create_autocmd("LspAttach", {
                callback = function(event)
                    local map = vim.keymap.set
                    local buf = event.buf

                    map("n", "gd",         vim.lsp.buf.definition,     { buffer = buf, desc = "Go to definition" })
                    map("n", "gD",         vim.lsp.buf.declaration,    { buffer = buf, desc = "Go to declaration" })
                    map("n", "gr",         vim.lsp.buf.references,     { buffer = buf, desc = "References" })
                    map("n", "gi",         vim.lsp.buf.implementation, { buffer = buf, desc = "Go to implementation" })
                    map("n", "K",          vim.lsp.buf.hover,          { buffer = buf, desc = "Hover docs" })
                    map("n", "<leader>rn", vim.lsp.buf.rename,         { buffer = buf, desc = "Rename symbol" })
                    map("n", "<leader>ca", vim.lsp.buf.code_action,    { buffer = buf, desc = "Code action" })
                    map("n", "<leader>d",  vim.diagnostic.open_float,  { buffer = buf, desc = "Line diagnostics" })
                    map("n", "[d",         vim.diagnostic.goto_prev,   { buffer = buf, desc = "Prev diagnostic" })
                    map("n", "]d",         vim.diagnostic.goto_next,   { buffer = buf, desc = "Next diagnostic" })
                end,
            })

            -- Python
            vim.lsp.config("pyright", {})

            -- Lua (aware of vim globals)
            vim.lsp.config("lua_ls", {
                settings = {
                    Lua = {
                        diagnostics = { globals = { "vim" } },
                        workspace = { checkThirdParty = false },
                        telemetry = { enable = false },
                    },
                },
            })

            -- Bash
            vim.lsp.config("bashls", {})

            -- C / C++
            vim.lsp.config("clangd", {})

            -- Enable all configured servers
            vim.lsp.enable({ "pyright", "lua_ls", "bashls", "clangd" })
        end,
    },
}
