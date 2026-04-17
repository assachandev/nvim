return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		require("lualine").setup({
			options = {
				theme = "auto",
				component_separators = { left = "│", right = "│" },
				section_separators = { left = "", right = "" },
				globalstatus = true,
				disabled_filetypes = { statusline = { "dashboard", "alpha", "ministarter" } },
			},
			sections = {
				lualine_a = { { "mode", separator = { left = "" }, right_padding = 2 } },
				lualine_b = {
					{ "branch", icon = "󰊢" },
					{
						"diff",
						symbols = { added = " ", modified = "󰝤 ", removed = " " },
					},
				},
				lualine_c = {
					{
						"filename",
						file_status = true,
						path = 1,
					},
					{
						"diagnostics",
						symbols = { error = " ", warn = " ", info = " ", hint = "󰌵 " },
					},
				},
				lualine_x = {
					{
						function()
							local clients = vim.lsp.get_clients({ bufnr = 0 })
							if #clients == 0 then return "No LSP" end
							local names = {}
							for _, c in ipairs(clients) do
								table.insert(names, c.name)
							end
							return table.concat(names, ", ")
						end,
						icon = "󰄭 LSP:",
						color = { gui = "bold" },
					},
					"filetype",
				},
				lualine_y = { "progress" },
				lualine_z = {
					{ "location", separator = { right = "" }, left_padding = 2 },
				},
			},
		})
	end,
}
