-- https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md

local null_ls_status_ok, null_ls = pcall(require, "null-ls")
if not null_ls_status_ok then
	return
end

local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics
local code_actions = null_ls.builtins.code_actions

local lsp_formatting = function(bufnr)
    vim.lsp.buf.format({
        filter = function(client)
            -- apply whatever logic you want (in this example, we'll only use null-ls)
            return client.name == "null-ls"
        end,
        bufnr = bufnr,
    })
end

-- if you want to set up formatting on save, you can use this as a callback
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})


-- https://github.com/jose-elias-alvarez/null-ls.nvim/wiki/Formatting-on-save
local function format_on_save(client, bufnr)
  if client.supports_method("textDocument/formatting") then
    vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
    vim.api.nvim_create_autocmd("BufWritePre", {
      group = augroup,
      buffer = bufnr,
      callback = function()
        -- nvim < 0.8
        -- vim.lsp.buf.formatting_sync()
        -- nvim >= 0.8
        -- vim.lsp.buf.format({ bufnr = bufnr })
        lsp_formatting(bufnr)
      end,
    })
  end
end

local function on_attach(client, bufnr)
  format_on_save(client, bufnr)
end

null_ls.setup({
  debug = false,
  -- you can reuse a shared lspconfig on_attach callback here
  on_attach = on_attach,
	sources = {
		-- lua
		formatting.stylua,
		-- diagnostics.luacheck,
		-- python
		formatting.black.with({ extra_args = { "--fast" } }),
		diagnostics.flake8,
		-- javascript/typescript
		formatting.prettierd,
		code_actions.eslint_d,
		diagnostics.eslint_d.with({
			diagnostics_format = "[eslint] #{m}\n(#{c})",
		}),
		-- rust
		formatting.rustfmt,
		-- spell
		-- diagnostics.cspell,
		diagnostics.misspell,
	},
})
