
local status_ok, todoComments = pcall(require, "todo-comments")
if not status_ok then
	return
end

todoComments.setup({})

-- local keymap = vim.keymap.set
-- local opts = { silent = true, noremap = true }

