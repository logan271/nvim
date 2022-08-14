local status_ok, telescope = pcall(require, "telescope")
if not status_ok then
	return
end

local actions = require("telescope.actions")

telescope.setup({
	defaults = {
		prompt_prefix = "λ ᐅ ",
		selection_caret = "ᐅ ",
		path_display = { "smart" },
		file_ignore_patterns = { ".git/", "node_modules" },
		sorting_strategy = "ascending",

		layout_config = {
			prompt_position = "top",
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
			},
		},
	},
	pickers = {
		buffers = {
			-- dropdown, cursor, ivy
			theme = "cursor",
			previewer = false,
		},
		registers = {
			theme = "cursor",
			previewer = false,
		},
		marks = {
			theme = "cursor",
			previewer = false,
		},
		command_history = {
			theme = "cursor",
			previewer = false,
		},
	},
	extensions = {},
})

local keymap = vim.keymap.set
local opts = { silent = true, noremap = true }

-- Lists Function names, variables, from Treesitter!
-- keymap("n", "<leader>ft", ":Telescope treesitter<CR>", opts)
keymap("n", "<leader>ff", ":Telescope find_files<CR>", opts)
keymap("n", "<leader>fF", ":Telescope oldfiles<CR>", opts)
-- search
-- Searches for the string under your cursor in your current working directory
keymap("n", "<leader>ss", ":Telescope grep_string<CR>", opts)
-- Search for a string in your current working directory and get results live as you type (respecting .gitignore)
keymap("n", "<leader>sS", ":Telescope live_grep<CR>", opts)
keymap("n", "<leader>fp", ":Telescope projects<CR>", opts)
keymap("n", "<leader>fc", ":Telescope command_history<CR>", opts)
keymap("n", "<leader>fr", ":Telescope registers<CR>", opts)
keymap("n", "<leader>fh", ":Telescope help_tags<CR>", opts)
keymap("n", "<leader>fm", ":Telescope marks<CR>", opts)
-- buffers
keymap("n", "<leader>bb", ":Telescope buffers<CR>", opts)
keymap("n", "<leader>bs", ":Telescope current_buffer_fuzzy_find<CR>", opts)
keymap("n", "<leader>bt", ":Telescope current_buffer_tags<CR>", opts)
-- git
keymap("n", "<leader>gc", ":Telescope git_commits<CR>", opts)
keymap("n", "<leader>gd", ":Telescope git_bcommits<CR>", opts)
keymap("n", "<leader>gb", ":Telescope git_branches<CR>", opts)
keymap("n", "<leader>gs", ":Telescope git_status<CR>", opts)
