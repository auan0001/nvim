return
{
  { 'mechatroner/rainbow_csv' },
  {
    'akinsho/toggleterm.nvim',
    config = function()
      require("toggleterm").setup {
        size = 20,
        direction = 'float',
        auto_scroll = true,
        start_in_insert = true,
        float_opts = {
          border = 'curved',
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
  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    ---@module "ibl"
    ---@type ibl.config
    opts = {},
  },
  {
    'ellisonleao/glow.nvim',
    config = function()
      require('glow').setup({
        width = 200,
        border = "rounded",
        style = "dark",
      })
    end,
  },
}
