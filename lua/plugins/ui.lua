return {
	{
		"folke/tokyonight.nvim",
		priority = 1000,
		lazy = false,
		opts = {
			style = "night",
			transparent = false,
			styles = {
				comments = { italic = false },
				keywords = { italic = false },
			},
		},
		config = function(_, opts)
			require("tokyonight").setup(opts)
			vim.cmd.colorscheme("tokyonight")
		end,
	},

	-- Modern UI for vim.ui.select and vim.ui.input
	{
		"stevearc/dressing.nvim",
		event = "VeryLazy",
		opts = {},
	},

	-- Visual scope (vertical line for current block)
	{
		"echasnovski/mini.indentscope",
		version = false,
		event = "VeryLazy",
		opts = {
			symbol = "│",
			options = { try_as_border = true },
		},
		init = function()
			vim.api.nvim_create_autocmd("FileType", {
				pattern = {
					"help",
					"Trouble", "trouble", "lazy", "mason",
					"notify",
				},
				callback = function()
					vim.b.miniindentscope_disable = true
				end,
			})
		end,
	},

}
