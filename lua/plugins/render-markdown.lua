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
			border = "above",
			language_pad = 1,
			style = "full",
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
		link = {
			enabled = true,
			hyperlink = "󰌷 ",
		},
		callout = {
			note = { raw = "[!NOTE]", rendered = "󰋽 Note" },
			tip = { raw = "[!TIP]", rendered = "󰌶 Tip" },
			important = { raw = "[!IMPORTANT]", rendered = "󰅾 Important" },
			warning = { raw = "[!WARNING]", rendered = "󰀪 Warning" },
			caution = { raw = "[!CAUTION]", rendered = "󰳦 Caution" },
		},
		table = {
			enabled = true,
		},
	},
}
