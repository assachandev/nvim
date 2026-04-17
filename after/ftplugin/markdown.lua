-- Force treesitter highlighting so heading highlights work
vim.treesitter.start()

local headings = {
    { level = 1, fg = "#ff757f" },
    { level = 2, fg = "#4fd6be" },
    { level = 3, fg = "#7dcfff" },
    { level = 4, fg = "#ff9e64" },
    { level = 5, fg = "#7aa2f7" },
    { level = 6, fg = "#c0caf5" },
}

for _, h in ipairs(headings) do
    vim.api.nvim_set_hl(0, "@markup.heading." .. h.level .. ".markdown", {
        fg = h.fg,
        bold = true,
    })
end
