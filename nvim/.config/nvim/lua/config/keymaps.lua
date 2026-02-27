vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "Switch line with line below" })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "Switch line with line above" })

vim.keymap.set("n", "J", "mzJ`z", { desc = "One line down" })
vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Half page downs" })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Half page up" })

vim.keymap.set('n', '<leader>co', ':copen<CR>', { desc = 'Open quickfix' })
vim.keymap.set('n', '<leader>cc', ':cclose<CR>', { desc = 'Close quickfix' })
vim.keymap.set('n', '<leader>lo', ':lopen<CR>', { desc = 'Open location list' })
vim.keymap.set('n', '<leader>lc', ':lclose<CR>', { desc = 'Close location list' })

vim.keymap.set('n', '<C-h>', '<C-w>h', { desc = 'Move to left split' })
vim.keymap.set('n', '<C-j>', '<C-w>j', { desc = 'Move to bottom split' })
vim.keymap.set('n', '<C-k>', '<C-w>k', { desc = 'Move to top split' })
vim.keymap.set('n', '<C-l>', '<C-w>l', { desc = 'Move to right split' })
vim.keymap.set('n', '<C-q>', '<C-w>q', { desc = 'Close window' })
vim.keymap.set('n', '<leader>q', '<cmd>bd!<cr>', { desc = 'Delete buffer' })

vim.keymap.set({ "n", "v" }, "<leader>y", "\"+ygv<Esc>", { desc = "Copy to system clipboard" })
vim.keymap.set("n", "<leader>Y", "\"+Ygv<Esc>", { desc = "Copy line to system clipboard" })
vim.keymap.set('v', 'y', 'ygv<Esc>', { noremap = true })

vim.keymap.set("x", "<leader>p", [["_dP]], { desc = "Paste without overriding the paster register" })

vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], { desc = "Search and replace" })

local default_vt = vim.diagnostic.config().virtual_text
vim.keymap.set("n", "<leader>ud", function()
    local vt = vim.diagnostic.config().virtual_text
    vim.diagnostic.config({ virtual_text = (vt == false) and default_vt or false })
end, { desc = "Toggle inline diagnostics" })

local default_s = vim.diagnostic.config().signs
vim.keymap.set("n", "<leader>us", function()
    local s = vim.diagnostic.config().signs
    vim.diagnostic.config({ signs = (s == false) and default_s or false })
end, { desc = "Toggle diagnostic signs" })
