local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

-- Highlight yanked text briefly
autocmd("TextYankPost", {
    group = augroup("highlight_yank", { clear = true }),
    callback = function()
        vim.highlight.on_yank({ higroup = "IncSearch", timeout = 150 })
    end,
})

-- Remove trailing whitespace on save
autocmd("BufWritePre", {
    group = augroup("trim_whitespace", { clear = true }),
    pattern = "*",
    callback = function()
        local pos = vim.api.nvim_win_get_cursor(0)
        vim.cmd([[%s/\s\+$//e]])
        vim.api.nvim_win_set_cursor(0, pos)
    end,
})

-- Restore cursor position when reopening a file
autocmd("BufReadPost", {
    group = augroup("restore_cursor", { clear = true }),
    callback = function()
        local mark = vim.api.nvim_buf_get_mark(0, '"')
        local line_count = vim.api.nvim_buf_line_count(0)
        if mark[1] > 0 and mark[1] <= line_count then
            pcall(vim.api.nvim_win_set_cursor, 0, mark)
        end
    end,
})

-- Auto-resize splits when terminal window is resized
autocmd("VimResized", {
    group = augroup("resize_splits", { clear = true }),
    callback = function()
        vim.cmd("tabdo wincmd =")
    end,
})

-- Enable spell check only for text-like filetypes
autocmd("FileType", {
    group = augroup("spell_text", { clear = true }),
    pattern = { "markdown", "text", "gitcommit", "tex" },
    callback = function()
        vim.opt_local.spell = true
    end,
})

-- Close certain filetypes with just 'q'
autocmd("FileType", {
    group = augroup("close_with_q", { clear = true }),
    pattern = { "help", "man", "qf", "lspinfo", "checkhealth" },
    callback = function(event)
        vim.bo[event.buf].buflisted = false
        vim.keymap.set("n", "q", "<cmd>close<cr>", { buffer = event.buf, silent = true })
    end,
})
