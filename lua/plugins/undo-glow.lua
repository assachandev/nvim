return {
    "y3owk1n/undo-glow.nvim",
    event = "VeryLazy",
    opts = {
        duration = 300,
        hl_group = "UndoGlow",
    },
    config = function(_, opts)
        local ug = require("undo-glow")
        ug.setup(opts)

        vim.keymap.set("n", "u",     ug.undo, { desc = "Undo with glow" })
        vim.keymap.set("n", "<C-r>", ug.redo, { desc = "Redo with glow" })
    end,
}
