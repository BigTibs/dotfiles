return {
    {
        "nvim-treesitter/nvim-treesitter",
        lazy = false,
        build = ":TSUpdate",
        opts = {
            auto_install = true,
            highlight = { enable = true },
            indent = { enable = true },
            ensure_installed = {
                "typescript",
                "javascript",
                "json",
                "lua",
                "vim",
                "markdown",
                "markdown_inline",
                "c_sharp",
            },
        },
    }
}
