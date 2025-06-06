vim.opt.expandtab = true
vim.opt.shiftwidth = 2
vim.opt.softtabstop = 2

local opts = { silent = true, noremap = true }

-- Toggler function
local function vim_opt_toggle(opt, on, off, name)
  local message = name
  if vim.opt[opt]:get() == off then
    vim.opt[opt] = on
    message = message .. " Enabled"
  else
    vim.opt[opt] = off
    message = message .. " Disabled"
  end
  vim.notify(message)
end

-- Map the enhanced rename function

vim.g.mapleader = ","
vim.g.maplocalleader = ","

-- Navigate panes
vim.keymap.set('n', '<c-h>', '<c-w>h')
vim.keymap.set('n', '<c-j>', '<c-w>j')
vim.keymap.set('n', '<c-k>', '<c-w>k')
vim.keymap.set('n', '<c-l>', '<c-w>l')

-- Navigate terminal panes from insert mode
vim.keymap.set('t', '<c-h>', '<esc><c-w>h')
vim.keymap.set('t', '<c-j>', '<esc><c-w>j')
vim.keymap.set('t', '<c-k>', '<esc><c-w>k')
vim.keymap.set('t', '<c-l>', '<esc><c-w>l')

-- Navigate buffers
vim.keymap.set("n", "<S-l>", vim.cmd.bnext)
vim.keymap.set("n", "<S-h>", vim.cmd.bprevious)

-- LSP
vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
vim.keymap.set("n", "<leader>ws", function() vim.lsp.buf.workspace_symbol() end, opts)
vim.keymap.set("n", "<leader>d", function() vim.diagnostic.open_float() end, opts)
vim.keymap.set("n", "<leader>l", function() vim.diagnostic.setloclist() end, opts)
vim.keymap.set("n", "<leader>ca", function() vim.lsp.buf.code_action() end, opts)
vim.keymap.set("n", "<leader>sr", function() vim.lsp.buf.references() end, opts)
vim.keymap.set("n", "<leader>rn", function() vim.lsp.buf.rename() end, opts)
vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
vim.keymap.set("i", "<c-h>", function() vim.lsp.buf.signature_help() end, opts)

-- Spelling, using toggler
vim.keymap.set("n", "<leader>s", function() vim_opt_toggle("spell", true, false, "Spelling") end)

-- Terminal mode escape
vim.keymap.set('t', '<Esc>', '<C-\\><C-n><CR>')

-- Matlab
vim.keymap.set('n', '<leader>mm', function() vim.cmd('vertical terminal matlab -nosplash -nodesktop') end, opts)

-- Telescope
local builtin = require('telescope.builtin')

vim.keymap.set('n', '<leader>ff', builtin.find_files, opts)
vim.keymap.set('n', '<leader>fl', builtin.live_grep, opts)
vim.keymap.set('n', '<leader>fg', builtin.git_files, opts)
vim.keymap.set('n', '<leader>fb', builtin.buffers, opts)
vim.keymap.set('n', '<leader>fh', builtin.help_tags, opts)
vim.keymap.set('n', '<leader>ff', builtin.find_files, opts)
vim.keymap.set('n', '<leader>xx', builtin.diagnostics, opts)

-- Edit dotfiles with Telescope
vim.keymap.set('n', '<leader>df',
  function()
    require('telescope.builtin').find_files({
      prompt_title = "Dotfiles",
      cwd = "~/.config/nvim/",
    })
  end, opts)

-- Find report files with Telescope
vim.keymap.set('n', '<leader>fr',
  function()
    require('telescope.builtin').find_files({
      prompt_title = "Master Thesis",
      cwd = "~/MSc/Report",
    })
  end, opts)

-- ToggleTerm

local Terminal = require('toggleterm.terminal').Terminal

-- Lazygit in ToggleTerm
local lazygit  = Terminal:new({
  cmd = "lazygit",
  dir = "git_dir",
  direction = "float",
  float_opts = {
    border = "double",
  },
  -- function to run on opening the terminal
  on_open = function(term)
    vim.cmd("startinsert!")
    vim.api.nvim_buf_set_keymap(term.bufnr, "n", "q", "<cmd>close<CR>", { noremap = true, silent = true })
  end,
  -- function to run on closing the terminal
  on_close = function(term)
    vim.cmd("startinsert!")
  end,
})

function _lazygit_toggle()
  lazygit:toggle()
end

vim.api.nvim_set_keymap("n", "<leader>lg", "<cmd>lua _lazygit_toggle()<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>tt", "<cmd>ToggleTerm<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<c-s>", "<cmd>vsplit<CR>", { noremap = true, silent = true })
