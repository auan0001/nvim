require("config.lazy")
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


-- Define the highlight group with a bright yellow color and bold text
vim.cmd("highlight CustomJsonStringYellow guifg=#FFFF00 gui=bold")
vim.cmd("highlight CustomJsonStringRed guifg=#FF0000 gui=bold")

-- Function to highlight specific terms in JSON files with case-insensitive search
local function highlight_terms_in_json_yellow()
  local terms_to_highlight = { "requirements", "minimum", "qualification", "basic", "skills", "required", "preferred" }
  local hl_group = "CustomJsonStringYellow"
  local bufnr = vim.api.nvim_get_current_buf()
  local lines = vim.api.nvim_buf_get_lines(bufnr, 0, -1, false)

  -- Function to perform case-insensitive search
  local function case_insensitive_find(s, pattern, init)
    pattern = pattern:gsub("%a", function(c)
      return string.format("[%s%s]", c:lower(), c:upper())
    end)
    return string.find(s, pattern, init)
  end

  for line_num, line in ipairs(lines) do
    for _, term in ipairs(terms_to_highlight) do
      local start_pos = 1
      while true do
        local start_idx, end_idx = case_insensitive_find(line, term, start_pos)
        if not start_idx then break end
        vim.api.nvim_buf_add_highlight(bufnr, -1, hl_group, line_num - 1, start_idx - 1, end_idx)
        start_pos = end_idx + 1
      end
    end
  end
end

-- Create an autocommand for JSON file type to highlight terms
vim.api.nvim_create_autocmd("FileType", {
  pattern = "json",
  callback = function() highlight_terms_in_json_yellow() end,
})

-- Function to highlight specific terms in JSON files with case-insensitive search
local function highlight_terms_in_json_red()
  local terms_to_highlight = { "plus", "prefer", "bonus" }
  local hl_group = "CustomJsonStringRed"
  local bufnr = vim.api.nvim_get_current_buf()
  local lines = vim.api.nvim_buf_get_lines(bufnr, 0, -1, false)

  -- Function to perform case-insensitive search
  local function case_insensitive_find(s, pattern, init)
    pattern = pattern:gsub("%a", function(c)
      return string.format("[%s%s]", c:lower(), c:upper())
    end)
    return string.find(s, pattern, init)
  end

  for line_num, line in ipairs(lines) do
    for _, term in ipairs(terms_to_highlight) do
      local start_pos = 1
      while true do
        local start_idx, end_idx = case_insensitive_find(line, term, start_pos)
        if not start_idx then break end
        vim.api.nvim_buf_add_highlight(bufnr, -1, hl_group, line_num - 1, start_idx - 1, end_idx)
        start_pos = end_idx + 1
      end
    end
  end
end

-- Create an autocommand for JSON file type to highlight terms
vim.api.nvim_create_autocmd("FileType", {
  pattern = "json",
  callback = function() highlight_terms_in_json_red() end,
})
vim.g.search_term = 'basic_req'
vim.g.macro_q = 'c"q y/{{{SEARCH_TERM}}}: "^Mf:<80><fd>af"<80><fd>aa^[p^'

-- Define a function to execute the macro with the pre-defined search term
function ExecuteMacroWithPredefinedSearchTerm()
  -- Replace the placeholder with the pre-defined search term
  local macro = vim.fn.substitute(vim.g.macro_q, '{{{SEARCH_TERM}}}', vim.g.search_term, '')
  -- Execute the modified macro
  vim.api.nvim_feedkeys(':' .. macro .. '\n', 'n', true)
end

-- Create a keybinding to execute the macro with the pre-defined search term
vim.api.nvim_set_keymap('n', '<leader>p', ':lua ExecuteMacroWithPredefinedSearchTerm()<CR>', { noremap = true, silent = true })
