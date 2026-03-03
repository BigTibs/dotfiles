return
-- {
--     "rose-pine/neovim",
--     name = "rose-pine",
--     opts = {
--         styles = {
--             transparency = true
--         }
--     },
--     config = function()
--         vim.cmd.colorscheme("rose-pine")
--         vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
--         vim.api.nvim_set_hl(0, "NormalNC", { bg = "none" })
--
--         -- Popups / menus
--         vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
--         vim.api.nvim_set_hl(0, "FloatBorder", { bg = "none" })
--         vim.api.nvim_set_hl(0, "Pmenu", { bg = "none" })
--     end
-- }
{
    "metalelf0/black-metal-theme-neovim",
    lazy = false,
    priority = 1000,
    config = function()
        require("black-metal").setup({
            theme = 'taake'
        })
        require("black-metal").load()
    end,
}
