require("config.lazy")
require("keybindings")

-- if vim.fn.argc() < 1 then
--   -- Create a new buffer
--   local buf = vim.api.nvim_create_buf(true, false)
--
--   -- Switch to the new buffer
--   vim.api.nvim_set_current_buf(buf)
--
--   -- Load 'orgmode' and display the agenda in the new buffer asynchronously
--   vim.schedule(function()
--     vim.cmd([[silent! lcd %:p:h]])
--     require('orgmode').action('agenda.agenda')
--   end)
-- end
