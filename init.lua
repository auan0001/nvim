require('packages')
require('configs.theme')
require('configs.lsp')
require('configs.treesitter')
require('configs.tree')
require('configs.lualine')
require('configs.comment')
require('configs.orgmode')
require('configs.clangd')
require('configs.cmp')
require('configs.luasnip')
require('configs.autopairs')
require('configs.null-ls')
require('configs.prettier-lsp')
require('configs.mason')
require('configs.mason-lspconfig')

-- basics
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

-- Python host
vim.g.python3_host_prog = '/bin/python'

-- .org-file indentation
vim.api.nvim_exec([[
  autocmd FileType org setlocal indentexpr=
  autocmd FileType org setlocal indentkeys=
]], false)


-- Automatically enter insert mode when navigating to a terminal buffer
vim.api.nvim_exec([[
  augroup TerminalAutoEnterInsert
    autocmd!
    autocmd TermOpen * startinsert
  augroup END
]], false)

if vim.fn.argc() < 1 then
  -- Create a new buffer
  local buf = vim.api.nvim_create_buf(true, false)

  -- Switch to the new buffer
  vim.api.nvim_set_current_buf(buf)

  -- Load 'orgmode' and display the agenda in the new buffer asynchronously
  vim.schedule(function()
    vim.cmd([[silent! lcd %:p:h]])
    require('orgmode').action('agenda.agenda')
  end)
end

-- Disable ligatures in Neovim
vim.cmd[[set guifont=your-font:h10]]  -- Set the desired font and size

-- Or, if you are using a terminal-based Neovim, set the font with the appropriate escape codes
-- vim.cmd[[set termguifont=your-font:h10]]

require('keybindings')
