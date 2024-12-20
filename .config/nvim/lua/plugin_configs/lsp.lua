local lsp_zero = require("lsp-zero")
local lsp_util = require('lspconfig.util');

lsp_zero.on_attach(function(bufnr)
    lsp_zero.default_keymaps({ buffer = bufnr })
    lsp_zero.buffer_autoformat()
end)

-- Fix Undefined global 'vim'
lsp_zero.configure('lua_ls', {
    settings = {
        Lua = {
            diagnostics = {
                globals = { 'vim' }
            }
        }
    }
})

lsp_zero.set_preferences({
    suggest_lsp_servers = false,
    sign_icons = {
        error = 'E',
        warn = 'W',
        hint = 'H',
        info = 'I'
    }
})

local function organize_imports()
	local params = {
		command = "_typescript.organizeImports",
		arguments = { vim.api.nvim_buf_get_name(0) },
		title = "",
	}
	vim.lsp.buf.execute_command(params)
end

lsp_zero.configure('ts_ls', {
    root_dir = lsp_util.root_pattern("package.json"),
    commands = {
      OrganizeImports = {
        organize_imports,
        description = "Organize Imports",
      },
    },
})

lsp_zero.setup()

require("mason").setup({})
require("mason-lspconfig").setup({
    ensure_installed = {
        'ts_ls',
        'eslint',
        'angularls',
        'html',
        'cssls',
        'lua_ls',
    },
        handlers = {
            lsp_zero.default_setup,
            lua_ls = function()
                local lua_opts = lsp_zero.nvim_lua_ls()
                require("lspconfig").lua_ls.setup(lua_opts)
            end,
        }
    })
