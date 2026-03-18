return
-------------------------------------------------------------------------------
-- Lackluster theme
-------------------------------------------------------------------------------
-- {
--     "slugbyte/lackluster.nvim",
--     lazy = false,
--     priority = 1000,
--     config = function()
--         local lackluster = require("lackluster")
--         local color = lackluster.color -- blue, green, red, orange, black, lack, luster, gray1-9
--
--         lackluster.setup({
--             tweak_background = {
--                 -- normal = 'none', -- transparent
--                 -- normal = '#000000', -- hexcode
--                 -- normal = '#ffffff', -- hexcode
--                 -- normal = color.green,    -- lackluster color
--             },
--             tweak_syntax = {
--                 string = "default",
--                 -- string = "#a1b2c3", -- custom hexcode
--                 -- string = color.green, -- lackluster color
--                 string_escape = "default",
--                 -- comment = color.gray5,
--                 builtin = "default", -- builtin modules and functions
--                 type = "default",
--                 keyword = "default",
--                 keyword_return = "default",
--                 keyword_exception = "default",
--             },
--         })
--
--         vim.cmd.colorscheme("lackluster-dark")
--     end
-- }

-------------------------------------------------------------------------------
-- Tokyodark theme
-------------------------------------------------------------------------------
{
    "tiagovla/tokyodark.nvim",
    opts = {
        gamma = 1.00,
        styles = {
            comments = { italic = true }, -- style for comments
            keywords = {},                -- style for keywords
            identifiers = {},             -- style for identifiers
            functions = {},               -- style for functions
            variables = {},               -- style for variables
        },
    },
    config = function(_, opts)
        require("tokyodark").setup(opts) -- calling setup is optional
        vim.cmd("colorscheme tokyodark")
    end,
}

-------------------------------------------------------------------------------
-- Ashen theme
-------------------------------------------------------------------------------
-- {
--     "ficcdaf/ashen.nvim",
--     lazy = false,
--     priority = 1000,
--     config = function()
--         vim.cmd("colorscheme ashen")
--     end,
-- }

-------------------------------------------------------------------------------
-- Miasma theme
-------------------------------------------------------------------------------
-- {
--     "xero/miasma.nvim",
--     lazy = false,
--     priority = 1000,
--     config = function()
--         vim.cmd("colorscheme miasma")
--     end,
-- }

-------------------------------------------------------------------------------
-- Darkrose theme
-------------------------------------------------------------------------------
-- {
--     "water-sucks/darkrose.nvim",
--     lazy = false,
--     priority = 1000,
--     config = function()
--         vim.cmd("colorscheme darkrose")
--     end,
-- }

-------------------------------------------------------------------------------
-- Darkvoid theme
-------------------------------------------------------------------------------
-- {
--     {
--         "darkvoid-theme/darkvoid.nvim",
--         lazy = false,    -- Charge immédiatement
--         priority = 1000, -- Charge avant les autres plugins
--         config = function()
--             require("darkvoid").setup({
--                 transparent = false,
--                 glow = false,
--                 show_end_of_buffer = true,
--             })
--
--             vim.cmd.colorscheme("darkvoid")
--         end,
--     },
-- }

-------------------------------------------------------------------------------
--  Orng theme
-------------------------------------------------------------------------------
-- {
--   "roerohan/orng.nvim",
--   lazy = false,
--   priority = 1000,
--   config = function()
--     require("orng").setup({
--       variant = "dark", -- "dark" or "light"
--       transparent = false,
--       italic_comment = false,
--     })
--     vim.cmd("colorscheme orng")
--   end,
-- }

-------------------------------------------------------------------------------
-- Rose pine theme
-------------------------------------------------------------------------------
-- {
--     "water-sucks/darkrose.nvim",
--     lazy = false,
--     priority = 1000,
-- }
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
