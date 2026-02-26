return {
    {
        'renerocksai/telekasten.nvim',
        dependencies = { 'nvim-telescope/telescope.nvim' },
        opts = {
            extension = ".md",
            home = vim.fn.expand("~/notes"),
            dailies = '/home/thin6/notes/dailies/',    -- path to daily notes
            weeklies = '/home/thin6/notes/weeklies',   -- path to weekly notes
            templates = '/home/thin6/notes/templates', -- path to templates

            -- Specific note templates
            -- set to `nil` or do not specify if you do not want a template
            template_new_note = '/home/thin6/notes/templates/note.md',     -- template for new notes
            template_new_daily = '/home/thin6/notes/templates/daily.md',   -- template for new daily notes
            template_new_weekly = '/home/thin6/notes/templates/weekly.md', -- template for new weekly notes
        },
        keys = {
            { "<leader>zp", "<cmd>Telekasten panel<CR>",              desc = "Telekasten panel" },
            { "<leader>zf", "<cmd>Telekasten find_notes<CR>",         desc = "Find notes" },
            { "<leader>zg", "<cmd>Telekasten search_notes<CR>",       desc = "Search notes" },
            { "<leader>zd", "<cmd>Telekasten goto_today<CR>",         desc = "Go to today" },
            { "<leader>zw", "<cmd>Telekasten goto_thisweek<CR>",      desc = "Go to today" },
            { "<leader>zz", "<cmd>Telekasten follow_link<CR>",        desc = "Follow link" },
            { "<leader>zn", "<cmd>Telekasten new_note<CR>",           desc = "New note" },
            { "<leader>zt", "<cmd>Telekasten new_templated_note<CR>", desc = "New templated note" },
            { "<leader>zc", "<cmd>Telekasten show_calendar<CR>",      desc = "Show calendar" },
            { "<leader>zb", "<cmd>Telekasten show_backlinks<CR>",     desc = "Show backlinks" },
            { "<leader>zI", "<cmd>Telekasten insert_img_link<CR>",    desc = "Insert image link" },
            {
                "<leader>mt",
                ":lua require('telekasten').toggle_todo({ v = true, onlyTodo = true })<CR>",
                mode = { "v", "n" },
                desc = "Toggle todo"
            }
        }
    },
}
