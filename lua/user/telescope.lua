local status_ok, telescope = pcall(require, "telescope")
if not status_ok then
  return
end

local actions = require "telescope.actions"

telescope.setup {
  defaults = {
    prompt_prefix = "λ ᐅ ",
    selection_caret = "ᐅ ",
    path_display = { "smart" },
    file_ignore_patterns = { ".git/", "node_modules" },
    sorting_strategy = "ascending",

    layout_config =  {
      prompt_position =  "top",
      width = 0.85,
      height = 0.85,
    },

    mappings = {
      i = {
        ["<C-c>"] = actions.close,

        ["<Down>"] = actions.cycle_history_next,
        ["<Up>"] = actions.cycle_history_prev,

        ["<C-j>"] = actions.move_selection_next,
        ["<C-k>"] = actions.move_selection_previous,

        ["<C-/>"] = actions.which_key,
      },
      n = {
        ["<C-c>"] = actions.close,

        ["?"] = actions.which_key,
      }
    },
  },
  pickers = {
    find_files = {
      -- dropdown, cursor, ivy
      -- theme = "dropdown",
    }
  },
  extensions = {
  },
}
