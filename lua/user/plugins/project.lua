local status_ok, project = pcall(require, "project_nvim")
if not status_ok then
	return
end
project.setup({
  -- Manual mode doesn't automatically change your root directory, so you have
  -- the option to manually do so using `:ProjectRoot` command.
  manual_mode = true,

	-- detection_methods = { "lsp", "pattern" }, -- NOTE: lsp detection will get annoying with multiple langs in one project
	detection_methods = { "pattern" },

  show_hidden = true,

	-- patterns used to detect root dir, when **"pattern"** is in detection_methods
	patterns = { ".git" },
})

local tele_status_ok, telescope = pcall(require, "telescope")
if not tele_status_ok then
	return
end

telescope.load_extension('projects')
