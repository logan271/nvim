local status_ok, symbolsOutline = pcall(require, "symbols-outline")
if not status_ok then
	return
end

symbolsOutline.setup({
	auto_preview = false,
})

local keymap = vim.keymap.set
local opts = { silent = true, noremap = true }

keymap("n", "gs", ":SymbolsOutline<cr>", opts)
