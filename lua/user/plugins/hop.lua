local status_ok, hop = pcall(require, "hop")
if not status_ok then
	return
end

-- helps `h: hop-config`
hop.setup({ keys = "etovxqpdygfblzhckisuran" })

local keymap = vim.keymap.set
local opts = { silent = true, noremap = true }

keymap("n", "<leader>jw", ":HopWord<cr>", opts)
keymap("n", "<leader>jc", ":HopChar1<cr>", opts)
keymap("n", "<leader>jl", ":HopLine<cr>", opts)

