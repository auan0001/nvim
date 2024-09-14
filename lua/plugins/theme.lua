return {
  {
    "rmehri01/onenord.nvim",
    opts = 
    {
      theme = nil, 
      borders = true, 
      fade_nc = true, 
      styles = {
        comments = "NONE", 
        strings = "NONE", 
        keywords = "NONE", 
        functions = "NONE", 
        variables = "NONE", 
        diagnostics = "underline", 
      },
      disable = {
        background = false, 
        cursorline = false, 
        eob_lines = true, 
      },
      custom_highlights = {
        todo = "bold"
      },

      custom_colors = {}, 
    }
  },
  {
    "nvim-lualine/lualine.nvim",
    opts = {
      options = {
        icons_enabled = false,
        theme = 'onenord',
        component_separators = { left = ' ', right = ' '},
        section_separators = { left = ' ', right = ' '},
        disabled_filetypes = {},
        always_divide_middle = true,
        globalstatus = false,
      },
      sections = {
        lualine_a = {'mode'},
        lualine_b = {'branch', 'diff', 'diagnostics'},
        lualine_c = {'filename'},
        lualine_x = {'encoding', 'fileformat', 'filetype'},
        lualine_y = {'progress', 'hostname'},
        lualine_z = {'location'}
      },
      inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = {'filename'},
        lualine_x = {'location'},
        lualine_y = {},
        lualine_z = {}
      },
      tabline = {},
      extensions = {}
    }
  },
  { "machakann/vim-highlightedyank" },
}
