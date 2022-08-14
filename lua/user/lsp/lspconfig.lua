local lspconfig_status_ok, lspconfig = pcall(require, "lspconfig")
if not lspconfig_status_ok then
	return
end

local on_attach = function(client, bufnr)
	-- auto format on save
	if client.server_capabilities.documentFormattingProvider then
		vim.api.nvim_create_autocmd("BufWritePre", {
			group = vim.api.nvim_create_augroup("Format", { clear = true }),
			buffer = bufnr,
			-- callback = function() vim.lsp.buf.formatting_seq_sync() end
			callback = function()
				vim.lsp.buf.formatting_seq_sync()
			end,
		})
	end

	-- FIXME: client.resolved_capabilities.document_formatting is deprecated but some plugins/lsp still use it
	-- FIXME: use client.server_capabilities.documentFormattingProvider instead
	-- use null-ls for formatting
	client.server_capabilities.documentFormattingProvider = false
	client.resolved_capabilities.document_formatting = false

	-- if client.name == "sumneko_lua" then
	-- 	client.server_capabilities.documentFormattingProvider = false
	-- 	client.resolved_capabilities.document_formatting = false
	-- end
	--
	-- if client.name == "tsserver" then
	-- 	client.server_capabilities.documentFormattingProvider = false
	-- 	client.resolved_capabilities.document_formatting = false
	-- end

	-- setup lsp keymaps
	require("user.lsp.lsp-keymaps")(bufnr)

	local status_ok, illuminate = pcall(require, "illuminate")
	if not status_ok then
		return
	end

	illuminate.on_attach(client)
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
