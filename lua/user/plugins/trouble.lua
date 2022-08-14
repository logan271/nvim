local status_ok, trouble = pcall(require, "trouble")
if not status_ok then
	return
end

trouble.setup({ })

local keymap = vim.keymap.set
local opts = { silent = true, noremap = true }

keymap("n", "<leader>xx", ":TroubleToggle<cr>", opts)
keymap("n", "<leader>xw", ":TroubleToggle workspace_diagnostics<cr>", opts)
keymap("n", "<leader>xd", ":TroubleToggle document_diagnostics<cr>", opts)
keymap("n", "<leader>xq", ":TroubleToggle quickfix<cr>", opts)
keymap("n", "<leader>xl", ":TroubleToggle loclist<cr>", opts)
keymap("n", "gR", ":TroubleToggle lsp_references<cr>", opts)

