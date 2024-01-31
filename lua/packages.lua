-- Packer bootstrapping
local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

return require('packer').startup({function(use)
  -- Packer
  use 'wbthomason/packer.nvim'
  -- Rest of plugins
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
  use 'williamboman/mason.nvim'
  use 'williamboman/mason-lspconfig'
  use {"akinsho/toggleterm.nvim", tag = '*', config = function()
    require("toggleterm").setup()
  end}

  use ("ahmedkhalf/project.nvim")
  use {
    'numToStr/Navigator.nvim',
    config = function()
      require('Navigator').setup()
    end
  }
use {
  -- "iurimateus/luasnip-latex-snippets.nvim",
  "auan0001/luasnip-latex-snippets.nvim",
  -- vimtex isn't required if using treesitter
  requires = { "L3MON4D3/LuaSnip", "lervag/vimtex" },
  config = function()
    require'luasnip-latex-snippets'.setup({ use_treesitter = true })
    require("luasnip").config.setup { enable_autosnippets = true }
  end,
}
  use "rafamadriz/friendly-snippets"
  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end,

  -- Floating Packer
  config = {
  display = {
    open_fn = function()
      return require('packer.util').float({ border = 'single' })
    end
  }}
})
