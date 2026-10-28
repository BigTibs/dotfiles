return {
    {
        "nvim-neotest/neotest",
        dependencies = {
            "nvim-neotest/nvim-nio",
            "nvim-lua/plenary.nvim",
            "antoinemadec/FixCursorHold.nvim",
            "nvim-treesitter/nvim-treesitter",
            -- .NET adapter
            "Issafalcon/neotest-dotnet",
        },
        config = function()
            require("neotest").setup({
                adapters = {
                    require("neotest-dotnet")({
                        dap = { justMyCode = false },
                        discovery_root = "solution" -- or "project"
                    }),
                },
            })

            -- Key mappings
            local neotest = require("neotest")
            vim.keymap.set('n', '<leader>tt', function() neotest.run.run() end, { desc = 'Run nearest test' })
            vim.keymap.set('n', '<leader>tf', function() neotest.run.run(vim.fn.expand('%')) end,
                { desc = 'Run current file' })
            vim.keymap.set('n', '<leader>td', function() neotest.run.run({ strategy = 'dap' }) end,
                { desc = 'Debug nearest test' })
            vim.keymap.set('n', '<leader>ts', function() neotest.summary.toggle() end, { desc = 'Toggle test summary' })
            vim.keymap.set('n', '<leader>to', function() neotest.output.open({ enter = true }) end,
                { desc = 'Show test output' })
            vim.keymap.set('n', '<leader>tO', function() neotest.output_panel.toggle() end,
                { desc = 'Toggle output panel' })
        end,
    },
}
