return {
    "mikavilpas/yazi.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    keys = {
        { "<leader>y", "<cmd>Yazi<cr>", desc = "yazi" },
    },
    opts = {
        open_for_directories = false,
        floating_window_scaling_factor = 0.85,
    },
}
