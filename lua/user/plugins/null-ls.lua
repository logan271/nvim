local null_ls_status_ok, null_ls = pcall(require, "null-ls")
if not null_ls_status_ok then
	return
end

-- https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md
local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics
local code_actions = null_ls.builtins.code_actions

-- https://github.com/prettier-solidity/prettier-plugin-solidity
null_ls.setup({
	debug = false,
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
		-- code_actions.eslint_d,
		-- diagnostics.eslint_d.with({
		-- 	diagnostics_format = "[eslint] #{m}\n(#{c})",
		-- }),
		-- rust
		formatting.rustfmt,
		-- spell
		-- diagnostics.cspell,
		diagnostics.misspell,
	},
})
