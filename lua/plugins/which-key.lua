return {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {
        delay = 300,
        icons = {
            mappings = false,
            breadcrumb = "»",
            separator = "→",
            group = "+",
        },
        win = {
            border = "rounded",
            padding = { 1, 2 },
            wo = { winblend = 0 },
        },
        layout = {
            spacing = 4,
            align = "left",
        },
        spec = {
            { "<leader>f", group = "find" },
            { "<leader>g", group = "git" },
            { "<leader>s", group = "split" },
            { "<leader>l", group = "lsp" },
            { "<leader>S", group = "spell/grammar" },
            { "<leader>ld", desc = "Line diagnostics" },
            { "<leader>lx", desc = "Toggle virtual text" },
            { "<leader>ll", desc = "Toggle hover float mode" },
            { "]s", desc = "Next misspelled word" },
            { "[s", desc = "Prev misspelled word" },
        },
    },
}
