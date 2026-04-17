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
                "pyright",        -- Python
                "lua_ls",         -- Lua
                "bashls",         -- Bash
                "rust_analyzer",  -- Rust
                "ltex",           -- Grammar check
                -- clangd installed system-wide via pacman
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
                    map("n", "<leader>lr", vim.lsp.buf.rename,         { buffer = buf, desc = "Rename symbol" })
                    map("n", "<leader>la", vim.lsp.buf.code_action,    { buffer = buf, desc = "Code action" })
                    map("n", "<leader>ld", vim.diagnostic.open_float,  { buffer = buf, desc = "Line diagnostics" })
                    map("n", "[d", function() vim.diagnostic.jump({ count = -1 }) end, { buffer = buf, desc = "Prev diagnostic" })
                    map("n", "]d", function() vim.diagnostic.jump({ count =  1 }) end, { buffer = buf, desc = "Next diagnostic" })
                end,
            })

            -- Diagnostic config
            vim.diagnostic.config({
                signs = {
                    text = {
                        [vim.diagnostic.severity.ERROR] = " ",
                        [vim.diagnostic.severity.WARN]  = " ",
                        [vim.diagnostic.severity.HINT]  = "󰠠 ",
                        [vim.diagnostic.severity.INFO]  = " ",
                    },
                },
                virtual_text = true,
                underline = true,
                update_in_insert = false,
                float = {
                    focusable = false,
                    style = "minimal",
                    border = "rounded",
                    source = true,
                },
            })

            -- Toggle virtual text only
            local virtual_text_enabled = true
            vim.keymap.set("n", "<leader>lx", function()
                virtual_text_enabled = not virtual_text_enabled
                vim.diagnostic.config({ virtual_text = virtual_text_enabled })
            end, { desc = "Toggle LSP virtual text" })

            -- Toggle between virtual text and auto hover float on error
            local augroup = vim.api.nvim_create_augroup("LspDiagnosticsHover", { clear = true })
            local hover_mode = false
            vim.keymap.set("n", "<leader>ll", function()
                hover_mode = not hover_mode
                virtual_text_enabled = not hover_mode
                vim.diagnostic.config({ virtual_text = virtual_text_enabled })
                vim.api.nvim_clear_autocmds({ group = augroup })
                if hover_mode then
                    vim.api.nvim_create_autocmd("CursorHold", {
                        group = augroup,
                        callback = function()
                            local has_float = false
                            for _, win in ipairs(vim.api.nvim_list_wins()) do
                                if vim.api.nvim_win_get_config(win).relative ~= "" then
                                    has_float = true
                                    break
                                end
                            end
                            if not has_float then
                                vim.diagnostic.open_float(nil, { focusable = false })
                            end
                        end,
                    })
                    vim.notify("LSP: hover mode ON", vim.log.levels.INFO)
                else
                    vim.notify("LSP: virtual text ON", vim.log.levels.INFO)
                end
            end, { desc = "Toggle LSP hover float mode" })

            -- Pass blink.cmp capabilities to all servers
            vim.lsp.config("*", {
                capabilities = require("blink.cmp").get_lsp_capabilities(),
            })

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

            -- Ltex (Grammar check)
            vim.lsp.config("ltex", {
                settings = {
                    ltex = { language = "en-US" },
                },
                -- Pass JVM flag via environment variable to bypass XML entity limit
                cmd_env = { JAVA_OPTS = "-Djdk.xml.totalEntitySizeLimit=0" },
            })

            -- Enable all configured servers
            vim.lsp.enable({ "pyright", "lua_ls", "bashls", "clangd", "rust_analyzer", "ltex" })
        end,
    },
}
