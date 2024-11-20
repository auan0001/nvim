local lsp_servers = { "lua_ls", "pyright", "ruff", "clangd", "rust_analyzer" }

return {
  -- Utility plugins
  { "machakann/vim-sandwich" },
  { "zhimsel/vim-stay" },
  { "tpope/vim-repeat" },
  {
    "windwp/nvim-autopairs",
    opts = {},
  },
  -- Mason plugin to install/manage LSP servers and tools
  {
    "williamboman/mason.nvim",
    build = ":MasonUpdate",
    opts = {},
  },
  -- Mason-LSPconfig integration to easily set up LSP servers
  {
    "williamboman/mason-lspconfig.nvim",
    opts = {
      ensure_installed = lsp_servers,
    },
  },
  -- Neovim LSPconfig for configuring language servers
  {
    "neovim/nvim-lspconfig",
    config = function()
      local lspconfig = require("lspconfig")
      local mason_lspconfig = require("mason-lspconfig")

      -- Default capabilities and on_attach function (optional)
      local capabilities = require("cmp_nvim_lsp").default_capabilities() -- If using `nvim-cmp`
      local on_attach = function(client, bufnr)
        -- Define common keymaps or commands if needed
      end

      -- Setup LSP servers with Mason
      mason_lspconfig.setup({
        ensure_installed = lsp_servers,
        handlers = {
          -- Default handler for servers that don't require custom configuration
          function(server_name)
            lspconfig[server_name].setup({
              capabilities = capabilities,
              on_attach = on_attach,
            })
          end,
          -- Specific configuration for lua_ls
          ["lua_ls"] = function()
            lspconfig.lua_ls.setup({
              capabilities = capabilities,
              on_attach = on_attach,
              settings = {
                Lua = {
                  diagnostics = {
                    globals = { "vim" }, -- Recognize 'vim' as a global variable
                  },
                },
              },
            })
          end,
          -- Specific configuration for ruff
          ["ruff"] = function()
            lspconfig.ruff.setup({
              capabilities = capabilities,
              on_attach = on_attach,
              init_options = {
                settings = {
                  args = { "--config=pyproject.toml" },
                },
              },
            })
          end,
        },
      })
    end,
  },
  {
    "stevearc/conform.nvim",
    config = function()
      require("conform").setup({
        formatters_by_ft = {
          lua = { "stylua" },
          -- Conform will run multiple formatters sequentially
          python = { "ruff_format", "ruff_fix" },
          -- You can customize some of the format options for the filetype (:help conform.format)
          rust = { "rustfmt", lsp_format = "fallback" },
          -- Conform will run the first available formatter
          javascript = { "prettierd", "prettier", stop_after_first = true },
          json = { "jq" }
        },
        format_on_save = {
          -- These options will be passed to conform.format()
          timeout_ms = 500,
          lsp_format = "fallback",
        },
      })
    end,
  }
}
