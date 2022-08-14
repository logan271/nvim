local status_ok, neogen = pcall(require, "neogen")
if not status_ok then
	return
end

hop.setup({ keys = "etovxqpdygfblzhckisuran" })

local keymap = vim.keymap.set
local opts = { silent = true, noremap = true }

keymap("n", "g/", ":Neogen<CR>", opts)
