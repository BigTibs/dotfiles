vim.g.mapleader = " "

-- Function to bootsrap lazy package manager
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

-- Plugins table in plugins_lazy
require("lazy").setup("plugins_list")

-- Apply general vim settings
require("settings")

-- Configure plugins
require("plugin_configs.requires")

-- Color scheme
require("colorscheme")

-- Key mappings
require("keymappings")
