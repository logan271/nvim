local status_ok, whichKey = pcall(require, "which-key")

if not status_ok then
	return
end

whichKey.setup({})
