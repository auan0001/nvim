-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out,                            "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)
vim.g.mapleader = ","
vim.g.maplocalleader = ","

vim.opt.viewoptions = { "cursor", "folds", "slash", "unix" }

vim.o.termguicolors = true
-- Set the tab width (indent size) to 4 spaces
vim.api.nvim_set_option('tabstop', 2)

-- Set the number of spaces used for each level of indentation
vim.api.nvim_set_option('shiftwidth', 2)

-- Use spaces for indentation instead of tab characters
vim.api.nvim_set_option('expandtab', true)
vim.opt.clipboard = 'unnamedplus'
vim.opt.encoding = 'UTF-8'
vim.opt.relativenumber = true
vim.opt.splitright = true
vim.opt.expandtab = true
vim.opt.shiftwidth = 2
vim.opt.softtabstop = 2

vim.diagnostic.config({
  virtual_text = true,
  signs = true,
  underline = true,
  update_in_insert = false,
  severity_sort = true,
  float = {
    border = "rounded",
  },
})

local lsp_handlers = vim.lsp.handlers

lsp_handlers["textDocument/hover"] = vim.lsp.with(lsp_handlers.hover, {
  border = "rounded",
})

lsp_handlers["textDocument/signatureHelp"] = vim.lsp.with(lsp_handlers.signature_help, {
  border = "rounded",
})

vim.lsp.util.open_floating_preview = (function(orig)
  return function(contents, syntax, opts)
    opts = opts or {}
    opts.border = "rounded"
    return orig(contents, syntax, opts)
  end
end)(vim.lsp.util.open_floating_preview)

-- Python host
vim.g.python3_host_prog = '/usr/bin/python3'

-- Setup lazy.nvim
require("lazy").setup({
  spec = {
    -- import your plugins
    { import = "plugins" },
  },
  -- ui config
  ui = {
    border = "single",
    size = {
      width = 0.8,
      height = 0.8,
    },
  },
  -- Configure any other settings here. See the documentation for more details.
  -- colorscheme that will be used when installing plugins.
  install = { colorscheme = { "habamax" } },
  -- automatically check for plugin updates
  checker = {
    enabled = true,
    notify = false
  },
})

vim.api.nvim_set_hl(0, "Visual", { bg = "#434C5E", fg = "NONE", blend = 0 })
