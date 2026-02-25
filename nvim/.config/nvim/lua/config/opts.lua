vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.splitbelow = true
vim.opt.splitright = true

vim.opt.smartindent = true

vim.opt.wrap = false

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 999
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 50
vim.opt.fileformats = "unix,dos" -- Otherwise, windows file have ^M at the end of line

vim.cmd([[autocmd FileType * set formatoptions-=ro]])
vim.opt.colorcolumn = "100"

vim.g.dotnet_errors_only = true
vim.g.dotnet_show_project_file = true

-- Custom status line that displays current LSP
function _G.lsp_status()
    local buf_clients = vim.lsp.get_clients({ bufnr = 0 })
    if #buf_clients == 0 then
        return ""
    end

    local buf_client_names = {}
    for _, client in pairs(buf_clients) do
        table.insert(buf_client_names, client.name)
    end

    return " LSP: " .. table.concat(buf_client_names, ", ")
end

vim.opt.statusline = "%f %m %r%=%{v:lua.lsp_status()} %l/%L : %c"
