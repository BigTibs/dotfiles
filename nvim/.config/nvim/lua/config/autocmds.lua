-- Auto wormat on save
local format_group = vim.api.nvim_create_augroup("LspFormatting", { clear = true })
vim.api.nvim_create_autocmd("BufWritePre", {
    group = format_group,
    pattern = "*",
    callback = function()
        vim.lsp.buf.format({ async = false })
    end,
})

-- Specify telekasten files to be markdown files
vim.api.nvim_create_autocmd("FileType", {
    pattern = "telekasten",
    callback = function()
        vim.bo.filetype = "markdown"
    end,
})

-- Autocmd for SQL filetypes
vim.api.nvim_create_autocmd('FileType', {
    pattern = { 'sql', 'mysql', 'plsql' },
    callback = function()
        -- Enable vim-dadbod-completion
        require('cmp').setup.buffer({
            sources = {
                { name = 'vim-dadbod-completion' },
                { name = 'buffer' },
            },
        })
    end,
})

-- Set default compiler for cs files
-- Also makes :make use the compiler
vim.api.nvim_create_autocmd("FileType", {
    pattern = { "cs", "fsharp" },
    callback = function()
        vim.cmd("compiler dotnet")
        vim.opt.scroll = 8
        vim.opt.scrolloff = 8
        vim.opt.sidescroll = 5
        vim.opt.sidescrolloff = 15
    end,
})
