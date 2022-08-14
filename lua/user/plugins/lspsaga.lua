local status_ok, saga = pcall(require, "lspsaga")

if not status_ok then
	return
end

-- https://github.com/glepnir/lspsaga.nvim
saga.init_lsp_saga({})
