-- Which key
-- local wk = require("which-key")
-- wk.register(mappings, opts)

vim.keymap.set("n", "<leader>pv", vim.cmd.Ex, { desc = "Open netwr" })

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "One line downs" })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "One line up" })

vim.keymap.set("n", "J", "mzJ`z", { desc = "One line down" })
vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Half page downs" })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Half page up" })
vim.keymap.set("n", "n", "nzzzv", { desc = "Center cursor" })
vim.keymap.set("n", "N", "Nzzzv", { desc = "Center cursor" })

-- greatest remap ever
vim.keymap.set("x", "<leader>p", [["_dP]])

-- next greatest remap ever : asbjornHaland
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]], { desc = "Copy to system clipboard" })
vim.keymap.set("n", "<leader>Y", [["+Y]], { desc = "Copy line to system clipboard" })

vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]], { desc = "Delete without overwriting register'" })

vim.keymap.set("n", "Q", "<nop>", { desc = "Litterally does nothing" })
vim.keymap.set("n", "<leader>f", vim.lsp.buf.format, { desc = "Format buffer" })
vim.keymap.set("n", "<leader>w", "gg=G", { desc = "Format when lsp not working" })

-- vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
-- vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz", { desc = "Don't know what that is"})
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz", { desc = "Don't know what that is"})

vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], { desc = "Search and replace"})
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { desc = "Make file executable"})

vim.keymap.set("n", "<leader><leader>", function()
    vim.cmd("so")
end,
{ desc = "Source file"})
vim.keymap.set("n", "<leader>g" , "<cmd>LazyGit<CR>")
