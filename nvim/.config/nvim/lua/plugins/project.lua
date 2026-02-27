return {
    "ahmedkhalf/project.nvim",
    config = function()
        require("project_nvim").setup({
            detection_methods = { "lsp", "pattern" },
            patterns = { ".git", "Makefile", "package.json", "*.sln", "*.csproj" },

            show_hidden = false,

            exclude_dirs = {},
        })

        require('telescope').load_extension('projects')

        vim.keymap.set('n', '<leader>fp', ':Telescope projects<CR>', { desc = 'Find Projects' })
    end
}
