return {
	"akinsho/bufferline.nvim",
	version = "*",
	dependencies = "nvim-tree/nvim-web-devicons",
	event = "VeryLazy",
	keys = {
		{ "<Tab>",   "<cmd>BufferLineCycleNext<cr>",  desc = "Next buffer" },
		{ "<S-Tab>", "<cmd>BufferLineCyclePrev<cr>",  desc = "Prev buffer" },
		{ "<leader>bp", "<cmd>BufferLinePick<cr>",        desc = "Pick buffer" },
		{ "<leader>bc", "<cmd>BufferLinePickClose<cr>",   desc = "Pick and close buffer" },
		{ "<leader>bo", "<cmd>BufferLineCloseOthers<cr>", desc = "Close other buffers" },
	},
	config = function()
		require("bufferline").setup({
			options = {
				mode = "buffers",
				separator_style = "thin", -- "slant" | "thick" | "thin" | { 'any', 'any' }
				always_show_bufferline = true,
				show_buffer_close_icons = true,
				show_close_icon = true,
				color_icons = true,
				diagnostics = "nvim_lsp",
				diagnostics_indicator = function(count, level, diagnostics_dict, context)
					local icon = level:match("error") and " " or " "
					return " " .. icon .. count
				end,
				hover = {
					enabled = true,
					delay = 200,
					reveal = { "close" },
				},
			},
		})

		-- Jump to buffer by number (1-9)
		for i = 1, 9 do
			vim.keymap.set("n", "<leader>" .. i, "<cmd>BufferLineGoToBuffer " .. i .. "<cr>", { desc = "Go to buffer " .. i })
		end
	end,
}
