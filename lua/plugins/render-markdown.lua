return {
	"MeanderingProgrammer/render-markdown.nvim",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	ft = { "markdown", "norg", "rmd", "org" },
	opts = {
		restart_highlighter = true,
		heading = {
			sign = false,
			icons = { "󰎤 ", "󰎧 ", "󰎪 ", "󰎭 ", "󰎱 ", "󰎳 " },
		},
		code = {
			sign = false,
			width = "block",
			right_pad = 1,
		},
		bullet = {
			enabled = true,
		},
		checkbox = {
			enabled = true,
			unchecked = {
				icon = "   󰄱 ",
			},
			checked = {
				icon = "   󰱒 ",
			},
		},
	},
}
