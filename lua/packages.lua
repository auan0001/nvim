-- Bootstrapping Lazy.nvim
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

-- Setting up Lazy.nvim
require("lazy").setup({
  -- Plugins list

  -- CMP Plugins
  { "hrsh7th/nvim-cmp" },
  { "hrsh7th/cmp-buffer" },
  { "hrsh7th/cmp-cmdline" },
  { "hrsh7th/cmp-nvim-lsp" },
  { "hrsh7th/cmp-path" },
  { "saadparwaiz1/cmp_luasnip" },

  -- Snippets
  { "L3MON4D3/LuaSnip" },
  { "rafamadriz/friendly-snippets" },
  {
    "iurimateus/luasnip-latex-snippets.nvim",
    config = function()
      require'luasnip-latex-snippets'.setup({ use_treesitter = true })
      require("luasnip").config.setup { enable_autosnippets = true }
    end,
  },

  -- Tex
  { "lervag/vimtex" },

  -- Utility Plugins
  { "windwp/nvim-autopairs" },
  { "norcalli/nvim-colorizer.lua" },
  { "windwp/nvim-ts-autotag" },

  -- File Explorer and Icons
  { "kyazdani42/nvim-tree.lua" },
  { "kyazdani42/nvim-web-devicons" },

  -- Miscellaneous
  { "machakann/vim-highlightedyank" },
  { "machakann/vim-sandwich" },
  { "neovim/nvim-lspconfig" },
  { "nvim-lua/plenary.nvim" },

  -- UI Plugins
  { "nvim-lualine/lualine.nvim" },
  { "rmehri01/onenord.nvim" }, -- Nord theme
  { "nvim-orgmode/orgmode" },

  -- Telescope (Lazy-loaded)
  {
    "nvim-telescope/telescope.nvim",
    cmd = "Telescope",
    dependencies = { "nvim-lua/plenary.nvim" }
  },

  -- Treesitter (For better syntax highlighting and parsing)
  { "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" },

  -- Commenting Plugin
  { "numToStr/Comment.nvim" },

  -- Navigation
  { "tpope/vim-repeat" },
  { "zhimsel/vim-stay" },
  { "folke/trouble.nvim" },
  {
    "numToStr/Navigator.nvim",
    config = function() require('Navigator').setup() end
  },

  -- Debugging and Formatting
  { "mfussenegger/nvim-dap" },
  { "jose-elias-alvarez/null-ls.nvim" },
  { "MunifTanjim/prettier.nvim" },
  { "williamboman/mason.nvim" },
  { "williamboman/mason-lspconfig" },

  -- Terminal
  {
    "akinsho/toggleterm.nvim",
    version = '*',
    config = function() require("toggleterm").setup() end
  },

  -- Project management
  { "ahmedkhalf/project.nvim" },

  -- Jinja Syntax Highlighting
  { "lepture/vim-jinja" },
}, {
  -- UI configuration for Lazy.nvim
  ui = {
    border = "single",  -- Set the border for floating windows to single
  }
})
