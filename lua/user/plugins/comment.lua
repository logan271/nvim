local status_ok, comment = pcall(require, "Comment")
if not status_ok then
	return
end

local status_ok, ft = pcall(require, "Comment.ft")
if not status_ok then
	return
end

-- by default json files does't not allow comment
-- https://github.com/numToStr/Comment.nvim#ft-lua
ft.json = {'//%s', '/*%s*/'}

-- https://github.com/numToStr/Comment.nvim
comment.setup({
	---Add a space b/w comment and the line
	---@type boolean|fun():boolean
	padding = true,

	---Whether the cursor should stay at its position
	---NOTE: This only affects NORMAL mode mappings and doesn't work with dot-repeat
	---@type boolean
	sticky = true,

	---Lines to be ignored while comment/uncomment.
	---Could be a regex string or a function that returns a regex string.
	---Example: Use '^$' to ignore empty lines
	---@type string|fun():string
	ignore = nil,
})

-- Comment
local keymap = vim.keymap.set
local opts = { silent = true, noremap = true }
keymap("n", "<leader>/", "<cmd>lua require('Comment.api').toggle_current_linewise()<CR>", opts)
keymap("x", "<leader>/", '<ESC><CMD>lua require("Comment.api").toggle_linewise_op(vim.fn.visualmode())<CR>')

