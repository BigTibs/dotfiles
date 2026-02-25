return {
    {
        "OXY2DEV/markview.nvim",
        lazy = false,
        opts = {
            -- preview = {
            --     icon_provider = "devicons",
            -- }
        },
        dependencies = {
            'saghen/blink.cmp',
        },
        keys = {
            { "<leader>ms", "<CMD>Markview splitToggle<CR>",  desc = "Toggles `splitview` for current buffer." },
        }
    }
}
