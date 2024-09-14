return {
  'lervag/vimtex',
  ft = { "tex" },
  config = function()
    vim.g.vimtex_view_method = 'zathura'  -- or your preferred PDF viewer
    vim.g.vimtex_compiler_method = 'latexmk'
    vim.g.vimtex_compiler_auto = 1
    vim.g.vimtex_mainfile = 'main.tex'
    vim.g.vimtex_fold_enabled = 1
    vim.g.vimtex_quickfix_open_on_warning = 0
    vim.g.vimtex_quickfix_open_on_error = 1
    -- vim.g.vimtex_complete_bib = 1
    vim.g.vimtex_quickfix_autoclose = 1
    vim.g.vimtex_compiler_latexmk = {
      build_dir = '',
      callback = 1,
      continuous = 1,
      executable = 'latexmk',
      hooks = {},
      options = {
        '-pdf',
        '-lualatex',
        '-shell-escape',
      },
    }
  end
}
-- return {
--   {
--     config = function()
--
--       -- Enable automatic compilation on save
--
--       -- Set the main file (replace 'main.tex' with your actual main LaTeX file)
--
--       -- Set up mappings for compiling and viewing
--       vim.api.nvim_set_keymap('n', '<Leader>ll', '<Plug>Tex_LaTeX', {})
--       vim.api.nvim_set_keymap('n', '<Leader>lv', '<Plug>Tex_View', {})
--       vim.api.nvim_set_keymap('n', '<Leader>lc', '<Plug>Tex_Clean', {})
--     end,
--   }
-- }
