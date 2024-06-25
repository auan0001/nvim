vim.opt.expandtab = true
vim.opt.shiftwidth = 2
vim.opt.softtabstop = 2

local opts = {silent = true, noremap = true}

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
vim.keymap.set("n", "gd", function () vim.lsp.buf.definition() end, opts)
vim.keymap.set("n", "K", function () vim.lsp.buf.hover() end, opts)
vim.keymap.set("n", "<leader>vws", function () vim.lsp.buf.workspace_symbol() end, opts)
vim.keymap.set("n", "<leader>vd", function () vim.diagnostic.open_float() end, opts)
vim.keymap.set("n", "<leader>vl", function () vim.diagnostic.setloclist() end, opts)
vim.keymap.set("n", "<leader>vca", function () vim.lsp.buf.code_action() end, opts)
vim.keymap.set("n", "<leader>vrr", function () vim.lsp.buf.references() end, opts)
vim.keymap.set("n", "<leader>vrn", function () vim.lsp.buf.rename() end, opts)
vim.keymap.set("n", "[d", function () vim.diagnostic.goto_next() end, opts)
vim.keymap.set("n", "]d", function () vim.diagnostic.goto_prev() end, opts)
vim.keymap.set("i", "<c-h>", function () vim.lsp.buf.signature_help() end, opts)

-- Tree
vim.keymap.set("n", "<leader>e", vim.cmd.NvimTreeToggle)

-- Trouble
vim.keymap.set("n", "<leader>xx", function () vim.cmd.Trouble('document_diagnostics') end)

-- Spelling, using toggler
vim.keymap.set("n", "<leader>s", function () vim_opt_toggle("spell", true, false, "Spelling") end)

-- Terminal mode escape
vim.keymap.set('t', '<Esc>', '<C-\\><C-n><CR>')

-- Matlab
vim.keymap.set('n', '<leader>mm', function () vim.cmd('vertical terminal matlab -nosplash -nodesktop') end, opts)

-- Map <leader>r to run Python script in terminal
vim.api.nvim_set_keymap('n', '<leader>r', [[:term python3 %<CR>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>n', [[:!python ~/Scripts/Namn/namn <CR>]], { noremap = true, silent = true })

-- Telescope
local builtin = require('telescope.builtin')

vim.keymap.set('n', '<leader>ff', builtin.find_files, opts)
vim.keymap.set('n', '<leader>fl', builtin.live_grep, opts)
vim.keymap.set('n', '<leader>fg', builtin.git_files, opts)
vim.keymap.set('n', '<leader>fb', builtin.buffers, opts)
vim.keymap.set('n', '<leader>fh', builtin.help_tags, opts)

local function append_newline_wrap_quotes()
  -- Save the current buffer number
  local bufnr = vim.api.nvim_get_current_buf()

  -- Get the start and end positions of the visual selection
  local start_pos = vim.fn.getpos("'<")
  local end_pos = vim.fn.getpos("'>")

  -- Convert from 1-based to 0-based index
  local start_line = start_pos[2] - 1
  local end_line = end_pos[2] - 1

  -- Get lines in the visual selection
  local lines = vim.api.nvim_buf_get_lines(bufnr, start_line, end_line + 1, false)

  -- Append newline character to each line
  for i = 1, #lines do
    lines[i] = lines[i] .. "\\n"
  end

  -- Concatenate all lines and wrap them with quotes
  local wrapped_lines = '"' .. table.concat(lines, "") .. '"'

  -- Replace the selected lines with the new wrapped text
  vim.api.nvim_buf_set_lines(bufnr, start_line, end_line + 1, false, { wrapped_lines })
end

-- Function to be called in visual mode
local function wrap_append_quote_visual()
  vim.api.nvim_command("'<,'>lua append_newline_wrap_quotes()")
end

-- Bind the function to a command for easy usage
vim.api.nvim_create_user_command('WrapAppendQuote', wrap_append_quote_visual, { range = true })

-- Define a function to search for the visual selection
local function search_visual_selection()
  local selected_text = vim.fn.getreg('"')
  if selected_text ~= '' then
    vim.fn.setreg('/', vim.fn.escape(selected_text, '/'))
  end
  vim.cmd('normal! n')
end

-- Create a keybinding for the function
vim.api.nvim_set_keymap('v', '<leader>/', '<cmd>lua search_visual_selection()<CR>', opts)

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
