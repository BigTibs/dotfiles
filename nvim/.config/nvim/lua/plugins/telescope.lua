local builtin = require("telescope.builtin")
local actions = require("telescope.actions")

return {
    {
        'nvim-telescope/telescope.nvim',
        version = '*',
        dependencies = {
            'nvim-lua/plenary.nvim',
            { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
        },
        keys = {
            { "<leader>ff", builtin.find_files, desc = "Telescope find files" },
            { "<leader>fg", builtin.live_grep,  desc = "Telescope live grep" },
            {
                "<leader>fb",
                function()
                    require("telescope.builtin").buffers({
                        sort_mru = true,
                        sort_lastused = true,
                        initial_mode = "normal",
                        theme = "dropdown",
                    })
                end,
                desc = "Telescope buffers",
            },
        },
        opts = {
            defaults = {
                -- path_display = { "smart" },
                layout_strategy = 'vertical',
                layout_config = {
                    preview_height = 0.6,
                    mirror = true,
                },
                mappings = {
                    n = {
                        ["d"] = actions.delete_buffer,
                    }
                }
            },
            pickers = {
                find_files = {
                    path_display = { "truncate" }, -- or "smart", "tail", "absolute"
                },
            }
        },
    }
}
