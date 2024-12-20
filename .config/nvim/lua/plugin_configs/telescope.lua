
local builtin = require('telescope.builtin')

vim.keymap.set('n', '<leader>pf', builtin.find_files, { desc = "Open Telescope" })

vim.keymap.set('n', '<C-p>', builtin.git_files, { desc = "Open Telescope (git)" })
vim.keymap.set('n', '<leader>ps', function()
    builtin.grep_string({ search = vim.fn.input("Grep > ") });
end,
{ desc = "Open Telescope (grep mode)" })
vim.keymap.set('n', '<leader>pb', "<cmd>Telescope buffers sort_mru=true sort_lastused=true initial_mode=normal theme=ivy<cr>", { desc = "Open telescope buffers"})

require('telescope').setup{
    defaults = {
        mappings = {
            n = {
                ["d"] = require('telescope.actions').delete_buffer,
                ["q"] = require('telescope.actions').close,
            }
        }
    }
}
