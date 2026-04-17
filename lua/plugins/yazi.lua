return {
    "mikavilpas/yazi.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    keys = {
        { "<leader>e", "<cmd>Yazi<cr>", desc = "file explorer" },
    },
    opts = {
        open_for_directories = false,
        floating_window_scaling_factor = 0.85,
    },
}
