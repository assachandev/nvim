return {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
        "hrsh7th/cmp-nvim-lsp",     -- LSP completions
        "hrsh7th/cmp-buffer",        -- words from current buffer
        "hrsh7th/cmp-path",          -- file path completions
        "L3MON4D3/LuaSnip",          -- snippet engine
        "saadparwaiz1/cmp_luasnip",  -- snippet completions
        "rafamadriz/friendly-snippets", -- pre-built snippets for many languages
    },
    config = function()
        local cmp = require("cmp")
        local luasnip = require("luasnip")

        require("luasnip.loaders.from_vscode").lazy_load()

        cmp.setup({
            snippet = {
                expand = function(args)
                    luasnip.lsp_expand(args.body)
                end,
            },
            mapping = cmp.mapping.preset.insert({
                ["<Tab>"]   = cmp.mapping.select_next_item(),
                ["<S-Tab>"] = cmp.mapping.select_prev_item(),
                ["<CR>"]    = cmp.mapping.confirm({ select = true }),
                ["<C-Space>"] = cmp.mapping.complete(),
                ["<C-e>"]   = cmp.mapping.abort(),
                ["<C-d>"]   = cmp.mapping.scroll_docs(4),
                ["<C-u>"]   = cmp.mapping.scroll_docs(-4),
            }),
            sources = cmp.config.sources({
                {
                    name = "nvim_lsp",
                    entry_filter = function(entry)
                        return entry:get_completion_item().label:match("^%d") == nil
                    end,
                },
                { name = "luasnip" },
                {
                    name = "buffer",
                    entry_filter = function(entry)
                        return entry:get_completion_item().label:match("^%d") == nil
                    end,
                },
                { name = "path" },
            }),
            formatting = {
                format = function(entry, item)
                    local source_labels = {
                        nvim_lsp = "[LSP]",
                        luasnip  = "[Snippet]",
                        buffer   = "[Buffer]",
                        path     = "[Path]",
                    }
                    item.menu = source_labels[entry.source.name]
                    return item
                end,
            },
        })
    end,
}
