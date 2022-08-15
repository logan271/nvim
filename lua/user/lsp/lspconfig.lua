local lspconfig_status_ok, lspconfig = pcall(require, "lspconfig")
if not lspconfig_status_ok then
	return
end

local function lsp_highlight_document(client)
	-- Set autocommands conditional on server_capabilities
	local status_ok, illuminate = pcall(require, "illuminate")
	if not status_ok then
		return
	end
	illuminate.on_attach(client)
end

local on_attach = function(client, bufnr)
	-- nvim >= 0.8
	-- https://github.com/jose-elias-alvarez/null-ls.nvim/wiki/Avoiding-LSP-formatting-conflicts
	-- Avoiding LSP formatting conflicts
	client.server_capabilities.documentFormattingProvider = false
	-- nvim < 0.8
	-- client.resolved_capabilities.document_formatting = false

	require("user.lsp.lsp-keymaps")(bufnr)
	lsp_highlight_document(client)
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true
capabilities = require("cmp_nvim_lsp").update_capabilities(capabilities)

local servers = {
	"sumneko_lua",
	"pyright",
	"jsonls",
	"tsserver",
	"rust_analyzer",
	"emmet_ls",
	"html",
	"taplo",
	"volar",
}

for _, server in pairs(servers) do
	local status_ok, server_opts = pcall(require, "user.lsp.servers." .. server)

	local opts = {
		capabilities = capabilities,
		on_attach = on_attach,
	}

	if status_ok then
		opts = vim.tbl_deep_extend("force", server_opts, opts)
	end

	lspconfig[server].setup(opts)
end
