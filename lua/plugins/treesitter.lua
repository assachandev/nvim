return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    event = { "BufReadPre", "BufNewFile" },
    opts = {
        ensure_installed = {
            "lua", "vim", "vimdoc",
            "bash", "json", "yaml", "toml",
            "html", "css", "javascript", "typescript",
            "python", "rust", "go",
        },
        auto_install = true,
        highlight = { enable = true },
        indent = { enable = true },
    },
}
