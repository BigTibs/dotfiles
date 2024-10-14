
require("obsidian").setup({
    workspaces = {
        {
            name = "Workshop-vault",
            path = "~/ObsidianVault"
        }
    },
    completion = {
        nvim_cmp = true,
        min_chars = 2,
        preprend_not_id = true,
    },
    new_notes_location = "current_dir",
    mappings = {
        ["<leader>of"] = {
            action = function()
                return require("obsidian").util.gf_passthrough()
            end,
            opts = { noremap = false, expr = true, buffer = true },
        },
        ["<leader>od"] = {
            action = function()
                return require("obsidian").util.toggle_checkbox()
            end,
            opts = { buffer = true },
        },
    },
})
vim.opt.conceallevel = 1

