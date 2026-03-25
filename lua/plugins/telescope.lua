return {
    "nvim-telescope/telescope.nvim",
    branch = "0.1.x",
    cmd = "Telescope",
    dependencies = {
        "nvim-lua/plenary.nvim",
    },
    keys = {
        { "<leader>ff", "<cmd>Telescope find_files<cr>",  desc = "Find files" },
        { "<leader>fg", "<cmd>Telescope live_grep<cr>",   desc = "Live grep" },
        { "<leader>fb", "<cmd>Telescope buffers<cr>",     desc = "Find buffers" },
        { "<leader>fh", "<cmd>Telescope help_tags<cr>",   desc = "Help tags" },
        { "<leader>fr", "<cmd>Telescope oldfiles<cr>",    desc = "Recent files" },
        { "<leader>fc", "<cmd>Telescope commands<cr>",    desc = "Commands" },
    },
    opts = {
        defaults = {
            prompt_prefix = " ",
            selection_caret = " ",
            sorting_strategy = "ascending",
            layout_config = {
                horizontal = {
                    prompt_position = "top",
                    preview_width = 0.55,
                },
            },
            preview = {
                treesitter = false,
            },
        },
    },
}
