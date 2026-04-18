return {
    -- Parser installer only — highlighting handled by Neovim 0.12 natively
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        event = { "BufReadPre", "BufNewFile" },
    },

    {
        "nvim-treesitter/nvim-treesitter-textobjects",
        dependencies = { "nvim-treesitter/nvim-treesitter" },
        event = { "BufReadPre", "BufNewFile" },
        config = function()
            local select = require("nvim-treesitter-textobjects.select")
            local move   = require("nvim-treesitter-textobjects.move")

            -- Select textobjects
            local keymaps = {
                ["af"] = "@function.outer",
                ["if"] = "@function.inner",
                ["aa"] = "@parameter.outer",
                ["ia"] = "@parameter.inner",
                ["ac"] = "@class.outer",
                ["ic"] = "@class.inner",
            }
            for key, query in pairs(keymaps) do
                vim.keymap.set({ "x", "o" }, key, function()
                    select.select_textobject(query, "textobjects")
                end, { desc = "Select " .. query })
            end

            -- Move between textobjects
            vim.keymap.set("n", "]f", function() move.goto_next_start("@function.outer", "textobjects") end, { desc = "Next function" })
            vim.keymap.set("n", "[f", function() move.goto_previous_start("@function.outer", "textobjects") end, { desc = "Prev function" })
            vim.keymap.set("n", "]a", function() move.goto_next_start("@parameter.inner", "textobjects") end, { desc = "Next argument" })
            vim.keymap.set("n", "[a", function() move.goto_previous_start("@parameter.inner", "textobjects") end, { desc = "Prev argument" })
        end,
    },
}
