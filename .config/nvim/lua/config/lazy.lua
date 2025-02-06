local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
  -- bootstrap lazy.nvim
  vim.fn.system({ "git", "clone", "--filter=blob:none", "https://github.com/folke/lazy.nvim.git", "--branch=stable", lazypath })
end

vim.opt.rtp:prepend(lazypath)

-- Make sure to set leader before loading lazy.nvim so that mappings are correct
vim.g.mapleader = " "

require("lazy").setup({
  spec = {
    { import = "plugins" },
    { import = "plugins.colorschemes" },
  },
  -- Configure any other settings here. See the documentation for more details.
  -- colorscheme that will be used when installing plugins.
  install = { colorscheme = { "eldritch" } },
  -- automatically check for plugin updates
  checker = { enabled = true },
})
