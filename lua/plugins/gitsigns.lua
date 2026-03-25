return {
    "lewis6991/gitsigns.nvim",
    event = { "BufReadPre", "BufNewFile" },
    opts = {
        signs = {
            add          = { text = "▎" },
            change       = { text = "▎" },
            delete       = { text = "" },
            topdelete    = { text = "" },
            changedelete = { text = "▎" },
        },
        on_attach = function(buf)
            local gs = package.loaded.gitsigns
            local map = vim.keymap.set

            -- Navigation
            map("n", "]h", gs.next_hunk,  { buffer = buf, desc = "Next hunk" })
            map("n", "[h", gs.prev_hunk,  { buffer = buf, desc = "Prev hunk" })

            -- Actions
            map("n", "<leader>gp", gs.preview_hunk,         { buffer = buf, desc = "Preview hunk" })
            map("n", "<leader>gb", gs.blame_line,            { buffer = buf, desc = "Blame line" })
            map("n", "<leader>gr", gs.reset_hunk,            { buffer = buf, desc = "Reset hunk" })
            map("n", "<leader>gd", gs.diffthis,              { buffer = buf, desc = "Diff this" })
        end,
    },
}
