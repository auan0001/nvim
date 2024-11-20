return
{
  { 'mechatroner/rainbow_csv' },
  {
    'akinsho/toggleterm.nvim',
    config = function()
      require("toggleterm").setup {
        size = 20,
        direction = 'float',
        start_in_insert = true,
        float_opts = {
          border = 'single',
        }
      }
    end
  },
  { "chrisbra/csv.vim" },
  'kristijanhusak/vim-dadbod-ui',
  dependencies = {
    { 'tpope/vim-dadbod',                     lazy = true },
    { 'kristijanhusak/vim-dadbod-completion', ft = { 'sql', 'mysql', 'plsql' }, lazy = true }, -- Optional
  },
  cmd = {
    'DBUI',
    'DBUIToggle',
    'DBUIAddConnection',
    'DBUIFindBuffer',
  },
  init = function()
    -- Your DBUI configuration
    vim.g.db_ui_use_nerd_fonts = 1
  end,
}
