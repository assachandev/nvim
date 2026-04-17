return {
    "folke/flash.nvim",
    event = "VeryLazy",
    keys = {
        { "s",     function() require("flash").jump()              end, desc = "Flash jump" },
        { "S",     function() require("flash").treesitter()        end, desc = "Flash treesitter" },
        { "r",     function() require("flash").remote()            end, desc = "Flash remote",           mode = "o" },
        { "R",     function() require("flash").treesitter_search() end, desc = "Flash treesitter search", mode = { "o", "x" } },
    },
    opts = {
        highlight = {
            backdrop = true,
        },
        jump = {
            autojump = true,
        },
        label = {
            uppercase = false,
        },
    },
}
