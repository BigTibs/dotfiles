return {
    { "m4xshen/autoclose.nvim" },
    { "lukas-reineke/indent-blankline.nvim" },
    { "nvim-treesitter/nvim-treesitter" },
    { "ThePrimeagen/harpoon" },
    { "lewis6991/gitsigns.nvim" },
    { "numToStr/Comment.nvim" },
    { "nvim-telescope/telescope.nvim",      dependencies = { "nvim-lua/plenary.nvim" } },
    { "nvim-lualine/lualine.nvim",          dependencies = { "nvim-tree/nvim-web-devicons" } },
    { "windwp/nvim-ts-autotag"},

    -- LSP
    { 'williamboman/mason.nvim' },
    { 'williamboman/mason-lspconfig.nvim' },

    { 'VonHeikemen/lsp-zero.nvim',          branch = 'v3.x' },
    { 'neovim/nvim-lspconfig' },
    { 'hrsh7th/cmp-nvim-lsp' },
    { 'hrsh7th/nvim-cmp' },
    { 'L3MON4D3/LuaSnip',                   dependencies = { 'rafamadriz/friendly-snippets' } },
    { "hrsh7th/cmp-buffer" },
    { "hrsh7th/cmp-path" },
    { "hrsh7th/cmp-cmdline" },
    { 'saadparwaiz1/cmp_luasnip' },
    { 'hrsh7th/cmp-nvim-lsp' },
    { 'hrsh7th/cmp-nvim-lua' },

    -- LazyGit
    {
        "kdheepak/lazygit.nvim",
        -- optional for floating window border decoration
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-telescope/telescope.nvim"
        },
    },

    -- Which Key
    {
        "folke/which-key.nvim",
        event = "VeryLazy",
    },
    -- Theme
    {
        "craftzdog/solarized-osaka.nvim",
        lazy = true,
        priority = 1000,
        opts = {},
    },

   -- {
   --     "rose-pine/neovim",
   --     name = "rose-pine",
   --     config = function()
   --         vim.cmd("colorscheme rose-pine")
   --     end
   -- },

    -- Obsidian
--    {
--        "epwalsh/obsidian.nvim",
--       version = "*", -- recommended, use latest release instead of latest commit
--        lazy = true,
--        ft = "markdown",
--        dependencies = {
--            "nvim-lua/plenary.nvim",
--        },
--   }

    { "rcarriga/nvim-notify" },
    {
        "folke/noice.nvim",
        event = "VeryLazy",
        dependencies = {
            -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
            "MunifTanjim/nui.nvim",
            -- OPTIONAL:
            --   `nvim-notify` is only needed, if you want to use the notification view.
            --   If not available, we use `mini` as the fallback
            "rcarriga/nvim-notify",
        }
    },
}
