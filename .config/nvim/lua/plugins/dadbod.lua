return {
    {
        "tpope/vim-dadbod",
        {
            "kristijanhusak/vim-dadbod-ui",
            keys = {
                { "<leader>db", "<CMD>DBUIToggle<CR>", desc = "Launch Dadbod UI" },
            }
        },
        {
            "kristijanhusak/vim-dadbod-completion",
            ft = { 'sql' }
        }
    }
}
