local status_ok, symbolsOutline = pcall(require, "symbols-outline")
if not status_ok then
	return
end

-- https://github.com/simrat39/symbols-outline.nvim

symbolsOutline.setup({
  auto_preview = false,
  auto_close = true,
})

local keymap = vim.keymap.set
local opts = { silent = true, noremap = true }

keymap("n", "gs", ":SymbolsOutline<cr>", opts)
