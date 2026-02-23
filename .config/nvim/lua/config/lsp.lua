vim.diagnostic.config({
    virtual_text = true,
    signs = true,             -- gutter signs
    underline = true,         -- underline the problematic range
    update_in_insert = false, -- don't update while typing (optional)
    severity_sort = true,
})

-- Keymaps on attach
local function on_attach(_, bufnr)
    local map = function(mode, lhs, rhs, desc)
        vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, desc = desc })
    end

    map("n", "gd", vim.lsp.buf.definition, "Go to definition")
    map("n", "ge", vim.diagnostic.open_float, "See detailed error")
    map("n", "gD", vim.lsp.buf.declaration, "Go to declaration")
    map("n", "gr", vim.lsp.buf.references, "References")
    map("n", "gi", vim.lsp.buf.implementation, "Implementation")
    map("n", "K", vim.lsp.buf.hover, "Hover")
    map("n", "<leader>rn", vim.lsp.buf.rename, "Rename symbol")
    map({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, "Code action")
    map("n", "<leader>lf", function()
        vim.lsp.buf.format({ async = true })
    end, "Format buffer (builtin with LSP)")
end

-- Capabilities (keep basic; extend if you use nvim-cmp)
local capabilities = vim.lsp.protocol.make_client_capabilities()

-- Define configs using the new Neovim API
vim.lsp.config("lua_ls", {
    on_attach = on_attach,
    capabilities = capabilities,
    settings = {
        Lua = {
            diagnostics = { globals = { "vim" } },
        },
    },
})

vim.lsp.config("ts_ls", {
    on_attach = on_attach,
    capabilities = capabilities,
})

vim.lsp.config("roslyn", {
    on_attach = on_attach,
    capabilities = capabilities,
    filetypes = { "cs" },
})

-- Enable the servers
vim.lsp.enable({
    "lua_ls",
    "ts_ls",
    "roslyn"
})





-- Overriding window style when hovering
-- vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(
--   vim.lsp.handlers.hover,
--   {
--     border = "rounded", -- "single" | "double" | "rounded" | "solid" | "shadow" | ou table personnalisée
--     max_width = 80,
--     max_height = 20,
--     focusable = false, -- true si tu veux pouvoir focus la fenêtre flottante
--     silent = true,
--   }
-- )

-- Patch because nvim-lspconfig overrides our override
local orig = vim.lsp.util.open_floating_preview

vim.lsp.util.open_floating_preview = function(contents, syntax, opts, ...)
    opts = opts or {}
    opts.border = opts.border or "rounded"
    opts.max_width = opts.max_width or 80
    opts.max_height = opts.max_height or 20
    return orig(contents, syntax, opts, ...)
end
