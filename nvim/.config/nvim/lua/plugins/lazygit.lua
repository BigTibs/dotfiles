return {
    "kdheepak/lazygit.nvim",
    dependencies = {
        "nvim-lua/plenary.nvim"
    },
    lazy = true,
    cmd = {
        "LazyGit",
        "LazyGitConfig",
        "LazyGitCurrentFile",
        "LazyGitFilter",
        "LazyGitFilterCurrentFile",
    },
    keys = {
        -- { "<leader>g", "<cmd>LazyGit<cr>", desc = "LazyGit" }
        {
            "<leader>g",
            function()
                -- Trouve le git root à partir du fichier actuel
                local file_dir = vim.fn.expand('%:p:h')
                local git_root = vim.fn.systemlist('git -C ' ..
                vim.fn.shellescape(file_dir) .. ' rev-parse --show-toplevel 2>/dev/null')[1]

                if git_root and git_root ~= '' and vim.v.shell_error == 0 then
                    -- Change vers le git root et lance lazygit
                    vim.cmd('cd ' .. git_root)
                    vim.cmd('LazyGit')
                else
                    vim.notify("No git repository found", vim.log.levels.WARN)
                end
            end,
            desc = "LazyGit (smart repo detection)"
        }
    }
}
