require('packer').startup({function(use)
  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-cmdline'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-path'
  use 'saadparwaiz1/cmp_luasnip'
  use 'windwp/nvim-autopairs'
  use 'windwp/nvim-ts-autotag'
  use 'kyazdani42/nvim-tree.lua'
  use 'kyazdani42/nvim-web-devicons'
  use 'lervag/vimtex'
  use 'machakann/vim-highlightedyank'
  use 'machakann/vim-sandwich'
  use 'neovim/nvim-lspconfig'
  use 'nvim-lua/plenary.nvim'
  use 'nvim-lualine/lualine.nvim'
  use 'rmehri01/onenord.nvim'
  use 'nvim-orgmode/orgmode'
  use 'nvim-telescope/telescope.nvim'
  use 'nvim-treesitter/nvim-treesitter'
  use 'numToStr/Comment.nvim'
  use 'tpope/vim-repeat'
  use 'zhimsel/vim-stay'
  use 'L3MON4D3/LuaSnip'
  use 'mfussenegger/nvim-dap'
  use 'folke/trouble.nvim'
  use 'jose-elias-alvarez/null-ls.nvim'
  use 'MunifTanjim/prettier.nvim'
  use {"akinsho/toggleterm.nvim", tag = '*', config = function()
    require("toggleterm").setup()
  end}
-- Lua
  use ("ahmedkhalf/project.nvim")
  use {
    'numToStr/Navigator.nvim',
    config = function()
      require('Navigator').setup()
    end
  }
  -- use {
  --   "auan0001/luasnip-latex-snippets.nvim",
  --   -- replace "lervag/vimtex" with "nvim-treesitter/nvim-treesitter" if you're
  --   -- using treesitter.
  --   requires = { "L3MON4D3/LuaSnip", "lervag/vimtex" },
  --   config = function()
  --     require('luasnip-latex-snippets').setup({use_treesitter = true})
  --     -- or setup({ use_treesitter = true })
  --   end,
  --   ft = "tex",
  -- }
  use "rafamadriz/friendly-snippets"
end,


-- floating Packer
config = {
  display = {
    open_fn = function()
      return require('packer.util').float({ border = 'single' })
    end
  }
}})
