return {
    "echasnovski/mini.animate",
    version = false,
    event = "VeryLazy",
    opts = {
        cursor = {
            enable = true,
            timing = function(_, n) return 150 / n end,
        },
        scroll = {
            enable = true,
            timing = function(_, n) return 100 / n end,
        },
        resize = { enable = true },
        open   = { enable = true },
        close  = { enable = true },
    },
}
