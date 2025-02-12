-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
--
-- vim.keymap.set("n", "<leader>pv", vim.cmd.Ex, { desc = "Open netwr" })

-- vim.keymap.set("n", "<leader>l", "<cmd>b#<CR>", { desc = "Toggle last opened buffer" })

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "Switch line with line below" })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "Switch line with line above" })

vim.keymap.set("n", "J", "mzJ`z", { desc = "One line down" })
vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Half page downs" })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Half page up" })

-- Paste without overriding the paste register
vim.keymap.set("x", "<leader>p", [["_dP]])

-- next greatest remap ever : asbjornHaland
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]], { desc = "Copy to system clipboard" })
vim.keymap.set("n", "<leader>Y", [["+Y]], { desc = "Copy line to system clipboard" })

vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]], { desc = "Delete without overwriting register'" })

vim.keymap.set("n", "Q", "<nop>", { desc = "Litterally does nothing" })
-- vim.keymap.set("n", "<leader>f", vim.lsp.buf.format, { desc = "Format buffer" })

-- vim.keymap.set("n", "<leader>k", "<cmd>cnext<CR>zz")
-- vim.keymap.set("n", "<leader>j", "<cmd>cprev<CR>zz")
-- vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz", { desc = "Don't know what that is" })
-- vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz", { desc = "Don't know what that is" })

-- vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], { desc = "Search and replace" })
-- vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { desc = "Make file executable" })
