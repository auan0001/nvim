return {
  {"machakann/vim-sandwich"},
  {"windwp/nvim-autopairs"},
  -- Mason plugin to install/manage LSP servers
  {
    "williamboman/mason.nvim",
    config = true,
    opts = {
      ensure_installed = { "lua_ls", "pylsp" },  -- Ensure both lua_ls and pylsp are installed
    },
  },
  -- Mason-LSPconfig integration to easily set up LSP servers
  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = { "lua_ls", "pylsp" },  -- Ensure both lua_ls and pylsp are configured
      })
    end,
  },
  -- Neovim LSPconfig for configuring language servers
  {
    "neovim/nvim-lspconfig",
    config = function()
      local lspconfig = require("lspconfig")

      -- Lua language server setup
      lspconfig.lua_ls.setup({
        settings = {
          Lua = {
            diagnostics = {
              globals = { "vim" },  -- Recognize 'vim' as a global variable
            },
          },
        },
      })

      -- Python language server setup
      lspconfig.pylsp.setup({
        settings = {
          pylsp = {
            plugins = {
              pycodestyle = {
                enabled = true,
                ignore = { "E501" },  -- Example: Ignore line-length warnings
              },
              pylint = {
                enabled = false,  -- Disable pylint if you prefer pycodestyle or other linters
              },
            },
          },
        },
      })
    end,
  },
}
