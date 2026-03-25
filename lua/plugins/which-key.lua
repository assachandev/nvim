return {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {
        delay = 300,
        icons = {
            mappings = false,
        },
        spec = {
            { "<leader>c", group = "claude" },
            { "<leader>f", group = "find" },
            { "<leader>g", group = "git" },
            { "<leader>b", group = "buffer" },
            { "<leader>s", group = "split" },
            { "<leader>x", group = "diagnostics" },
            { "<leader>w", group = "save" },
            { "<leader>q", group = "quit" },
            { "<leader>1", hidden = true },
            { "<leader>2", hidden = true },
            { "<leader>3", hidden = true },
            { "<leader>4", hidden = true },
            { "<leader>5", hidden = true },
            { "<leader>6", hidden = true },
            { "<leader>7", hidden = true },
            { "<leader>8", hidden = true },
            { "<leader>9", hidden = true },
        },
    },
}
