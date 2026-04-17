return {
    "stevearc/conform.nvim",
    event = "BufWritePre",
    opts = {
        formatters_by_ft = {
            python     = { "black" },
            lua        = { "stylua" },
            sh         = { "shfmt" },
            bash       = { "shfmt" },
            c          = { "clang_format" },
            cpp        = { "clang_format" },
        },
        format_on_save = {
            timeout_ms = 500,
            lsp_format = "fallback",
        },
    },
}
