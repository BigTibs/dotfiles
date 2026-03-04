return
{
    "slugbyte/lackluster.nvim",
    lazy = false,
    priority = 1000,
    config = function()
        local lackluster = require("lackluster")
        local color = lackluster.color -- blue, green, red, orange, black, lack, luster, gray1-9

        lackluster.setup({
            tweak_background = {
                -- normal = 'none', -- transparent
                normal = '#000000', -- hexcode
                -- normal = '#ffffff', -- hexcode
                -- normal = color.green,    -- lackluster color
            },
        })

        vim.cmd.colorscheme("lackluster")
    end
} -- {
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
-- {
--     "metalelf0/black-metal-theme-neovim",
--     lazy = false,
--     priority = 1000,
--     config = function()
--         require("black-metal").setup({
--             theme = 'taake'
--         })
--         require("black-metal").load()
--     end,
-- }
