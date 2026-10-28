return {
    {
        'stevearc/oil.nvim',
        opts = {
            keymaps = {
                ["<BS>"] = { "actions.parent", mode = "n" },
                ["h"] = { "actions.parent", mode = "n" },
                ["l"] = { "actions.select", mode = "n" },
            }
        },
        dependencies = { { "nvim-mini/mini.icons", opts = {} } },
        lazy = false,
        keys = {
            { "<leader>e", "<CMD>Oil<CR>", desc = "Open parent directory" },
        },
    }
}
