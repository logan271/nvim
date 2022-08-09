local status_ok, configs = pcall(require, "nvim-treesitter.configs")
if not status_ok then
	return
end

configs.setup({
  -- one of "all" or a list of languages
  ensure_installed = { "c", "lua", "rust", "go", "python", "typescript" },
  -- install languages synchronously (only applied to `ensure_installed`)
  sync_install = false,
  ignore_install = { "php", "phpdoc" }, -- List of parsers to ignore installing
	highlight = {
		enable = true, -- false will disable the whole extension
		disable = { "css" }, -- list of language that will be disabled
	},
	autopairs = {
		enable = true,
	},
	indent = { enable = true, disable = { "python", "css" } },
  -- rainbow = {
  --   enable = true,
  --   --list of languages you want to disable the plugin for
  --   disable = { "tsx", "jsx", "cpp" },
  --   extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
  --   max_file_lines = nil, -- Do not enable for files with more than n lines, int
  --    -- table of hex strings
  --   colors = {
  --     "#a3be8c",
  --     "#bf616a",
  --     "#d08770",
  --     "#88c0d0",
  --     "#5e81ac",
  --     "#b48ead",
  --   },
  --   -- termcolors = {} -- table of colour name strings
  -- }
})
