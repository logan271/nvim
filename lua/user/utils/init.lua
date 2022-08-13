local setup = function ()
	vim.api.nvim_command([[autocmd CursorHold   * lua require'user.utils.gitlens'.blameVirtText()]])
	vim.api.nvim_command([[autocmd CursorMoved  * lua require'user.utils.gitlens'.clearBlameVirtText()]])
	vim.api.nvim_command([[autocmd CursorMovedI * lua require'user.utils.gitlens'.clearBlameVirtText()]])
end

setup()
