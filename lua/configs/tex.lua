-- vimtex.lua
-- Configuration for the vimtex plugin

-- Set up the compiler
vim.g.vimtex_compiler_latexmk = {
  executable = 'latexmk',
  options = {
    '-pdf',
    '-interaction=nonstopmode',
    '-synctex=1',
  },
}

-- Enable automatic compilation on save
vim.g.vimtex_compiler_auto = 1

-- Set the main file (replace 'main.tex' with your actual main LaTeX file)
vim.g.tex_flavor = 'latex'
vim.g.vimtex_mainfile = 'main.tex'

-- Enable folding of sections and environments
vim.g.vimtex_fold_enabled = 1

-- Use Neovim terminal for compilation
vim.g.vimtex_quickfix_open_on_warning = 0
vim.g.vimtex_quickfix_open_on_error = 1

-- Use Zathura as the PDF viewer (replace with your preferred viewer)
vim.g.vimtex_view_method = 'zathura'

-- Enable completion for bibtex references
vim.g.vimtex_complete_bib = 1

-- Automatically close preview windows
vim.g.vimtex_quickfix_autoclose = 1

-- Set up mappings for compiling and viewing
vim.api.nvim_set_keymap('n', '<Leader>ll', '<Plug>Tex_LaTeX', {})
vim.api.nvim_set_keymap('n', '<Leader>lv', '<Plug>Tex_View', {})
vim.api.nvim_set_keymap('n', '<Leader>lc', '<Plug>Tex_Clean', {})
