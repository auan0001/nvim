return {
  {
    'nvim-orgmode/orgmode',
    dependencies = { 'nvim-treesitter/nvim-treesitter' },
    config = function()
      local theme = require('onenord.colors.onenord')

      -- Load custom tree-sitter grammar for org filetype
      -- require('orgmode').setup_ts_grammar()


      require('orgmode').setup({
        -- Work org-stuff
        org_agenda_files = {
          '~/Org/tasks.org',
          '~/Org/journal.org',
        },
        org_default_notes_file = '~/Org/tasks.org',

        -- Capture templates
        org_capture_templates = {
          t = {
            description = "Todo",
            template = "* TODO %^{Task}\nDEADLINE: %T\n:PROPERTIES:\n:DESCRIPTION: %^{Desc}\n:END:\n",
            target = '~/Org/tasks.org',
          },
          j = {
            description = 'Journal',
            template = '\n** %<%Y-%m-%d> %<%A>\n*** %U\n\n%?',
            target = '~/Org/journal.org',
          },
        },

        -- Custom keywords
        org_todo_keywords = { 'WORKOUT(w)', 'SOCIAL(s)', 'ACTIVE(a)', 'THESIS(p)', 'MEETING(m)', 'TODO(t)', 'UU(u)', 'EVENT(e)', '|', 'DONE(d)', 'CANCELED(c)' },

        org_todo_keyword_faces = {
          WORKOUT = ':foreground ' .. theme.blue .. ' :weight bold',
          SOCIAL = ':foreground ' .. theme.light_green .. ' :weight bold',
          ACTIVE = ':foreground ' .. theme.yellow .. ' :weight bold',
          THESIS = ':foreground ' .. theme.orange .. ' :weight bold',
          MEETING = ':foreground ' .. theme.light_red .. ' :weight bold',
          TODO = ':foreground ' .. theme.red .. ' :weight bold',
          UU = ':foreground ' .. theme.dark_red .. ' :weight bold',
          EVENT = ':foreground ' .. theme.pink .. ' :weight bold',
          DONE = ':foreground ' .. theme.green .. ' :weight bold',
          CANCELED = ':foreground ' .. theme.green .. ' :weight bold',
        },
      })
    end,
  }
}
