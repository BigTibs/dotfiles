local builtin = require("telescope.builtin")
local actions = require("telescope.actions")

return {
    {
        'nvim-telescope/telescope.nvim',
        version = '*',
        dependencies = {
            'nvim-lua/plenary.nvim',
            { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
            'nvim-telescope/telescope-project.nvim',
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
            {
                "<leader>fp",
                function()
                    require('telescope').extensions.project.project({
                        hidden_files = true, -- Show hidden files only for projects
                    })
                end,
                desc = "Find Project"
            },
        },
        config = function(_, opts)
            local telescope = require('telescope')

            -- Setup with your existing opts
            telescope.setup(opts)

            -- Load extensions after setup
            telescope.load_extension('fzf')
            telescope.load_extension('project')
        end,
        opts = {
            defaults = {
                layout_strategy = 'vertical',
                layout_config = {
                    vertical = {
                        preview_height = 0.6,
                        mirror = true,
                    }
                },
                mappings = {
                    n = {
                        ["d"] = actions.delete_buffer,
                    }
                }
            },
            pickers = {
                find_files = {
                    path_display = { "smart" }, -- or "smart", "tail", "absolute"
                    hidden = false,
                },
            },
            extensions = {
                project = {
                    base_dirs = {
                        { path = '~/dev/work',     max_depth = 2 },
                        { path = '~/dev/personal', max_depth = 3 },
                        { path = '~/.config' },
                    },
                    hidden_files = true, -- Show hidden files in project picker
                    theme = "dropdown",
                    order_by = "recent",
                    search_by = "title",
                },
            },
        },
    },
}
