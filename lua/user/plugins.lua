local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
	PACKER_BOOTSTRAP = fn.system({
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	})
	print("Installing packer close and reopen Neovim...")
	vim.cmd([[packadd packer.nvim]])
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
	return
end

-- Have packer use a popup window
packer.init({
	display = {
		open_fn = function()
			return require("packer.util").float({ border = "rounded" })
		end,
	},
})

-- Install your plugins here
return packer.startup(function(use)
	-- My plugins here
	-- https://github.com/wbthomason/packer.nvim
	use({ "wbthomason/packer.nvim" }) -- Have packer manage itself
	-- https://github.com/nvim-lua/plenary.nvim
	use({ "nvim-lua/plenary.nvim" }) -- Useful lua functions used by lots of plugins
	-- https://github.com/windwp/nvim-autopairs
	use({ "windwp/nvim-autopairs" }) -- Autopairs, integrates with both cmp and treesitter
	-- https://github.com/numToStr/Comment.nvim
	use({ "numToStr/Comment.nvim" })
	-- https://github.com/JoosepAlviste/nvim-ts-context-commentstring
	use({ "JoosepAlviste/nvim-ts-context-commentstring" })
	-- https://github.com/kyazdani42/nvim-web-devicons
	use({ "kyazdani42/nvim-web-devicons" })
	-- https://github.com/kyazdani42/nvim-tree.lua
	use({ "kyazdani42/nvim-tree.lua" })
	-- https://github.com/akinsho/bufferline.nvim
	use({ "akinsho/bufferline.nvim" })
	-- https://github.com/moll/vim-bbye
	use({ "moll/vim-bbye" })
	-- https://github.com/nvim-lualine/lualine.nvim
	use({ "nvim-lualine/lualine.nvim" })
	-- https://github.com/akinsho/toggleterm.nvim
	use({ "akinsho/toggleterm.nvim" })
	-- https://github.com/ahmedkhalf/project.nvim
	use({ "ahmedkhalf/project.nvim" })
	-- https://github.com/lewis6991/impatient.nvim
	use({ "lewis6991/impatient.nvim" })
	-- https://github.com/lukas-reineke/indent-blankline.nvim
	use({ "lukas-reineke/indent-blankline.nvim" })
	-- https://github.com/goolord/alpha-nvim
	use({ "goolord/alpha-nvim" })
	-- https://github.com/folke/todo-comments.nvim
	use({
		"folke/todo-comments.nvim",
		requires = "nvim-lua/plenary.nvim",
	})
	-- https://github.com/simrat39/symbols-outline.nvim
	use({ "simrat39/symbols-outline.nvim" })
	-- https://github.com/phaazon/hop.nvim
	use({
		"phaazon/hop.nvim",
		branch = "v2", -- optional but strongly recommended
	})
	-- https://github.com/danymat/neogen
	use({
		"danymat/neogen",
		requires = "nvim-treesitter/nvim-treesitter",
		-- Uncomment next line if you want to follow only stable versions
		-- tag = "*"
	})

	-- https://github.com/folke/which-key.nvim
	use({ "folke/which-key.nvim" })
	-- https://github.com/j-hui/fidget.nvim
	use({ "j-hui/fidget.nvim" })
	-- Colorschemes
	-- https://github.com/folke/tokyonight.nvim
	use({ "folke/tokyonight.nvim" })
	-- https://github.com/LunarVim/darkplus.nvim
	use({ "lunarvim/darkplus.nvim" })
	-- https://github.com/sainnhe/sonokai
	use({ "sainnhe/sonokai" })
	-- https://github.com/tanvirtin/monokai.nvim
	use({ "tanvirtin/monokai.nvim" })

	-- completion plugins
	-- https://github.com/hrsh7th/nvim-cmp
	use({ "hrsh7th/nvim-cmp" }) -- The completion plugin
	-- https://github.com/hrsh7th/cmp-buffer
	use({ "hrsh7th/cmp-buffer" }) -- buffer completions
	-- https://github.com/hrsh7th/cmp-path
	use({ "hrsh7th/cmp-path" }) -- path completions
	-- https://github.com/saadparwaiz1/cmp_luasnip
	use({ "saadparwaiz1/cmp_luasnip" }) -- snippet completions
	-- https://github.com/hrsh7th/cmp-nvim-lsp
	use({ "hrsh7th/cmp-nvim-lsp" })
	-- https://github.com/hrsh7th/cmp-nvim-lua
	use({ "hrsh7th/cmp-nvim-lua" })

	-- https://github.com/kylechui/nvim-surround
	use({ "kylechui/nvim-surround" })

	-- snippets
	-- https://github.com/L3MON4D3/LuaSnip
	use({ "L3MON4D3/LuaSnip" }) --snippet engine
	-- https://github.com/rafamadriz/friendly-snippets
	use({ "rafamadriz/friendly-snippets" }) -- a bunch of snippets to use
	-- https://github.com/folke/trouble.nvim
	use({ "folke/trouble.nvim" })
	-- LSP
	-- https://github.com/neovim/nvim-lspconfig
	use({ "neovim/nvim-lspconfig" }) -- enable LSP
	-- https://github.com/williamboman/mason.nvim
	use({ "williamboman/mason.nvim" })
  -- https://github.com/williamboman/mason-lspconfig.nvim
  use({ "williamboman/mason-lspconfig.nvim" })
	-- https://github.com/jose-elias-alvarez/null-ls.nvim
	use({ "jose-elias-alvarez/null-ls.nvim" }) -- for formatters and linters
	-- https://github.com/RRethy/vim-illuminate
	use({ "RRethy/vim-illuminate" })
	-- https://github.com/glepnir/lspsaga.nvim
	use({ "glepnir/lspsaga.nvim" }) -- LSP UIs
	-- https://github.com/ray-x/lsp_signature.nvim
	-- use({
	-- 	"ray-x/lsp_signature.nvim",
	-- 	config = function()
	-- 		require("lsp_signature").setup({})
	-- 	end,
	-- })

	-- Telescope
	-- https://github.com/nvim-telescope/telescope.nvim
	use({ "nvim-telescope/telescope.nvim" })

	-- Treesitter
	use({ "nvim-treesitter/nvim-treesitter" })
	use({
		"nvim-telescope/telescope-fzf-native.nvim",
		run = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build",
	})

	-- Git
	-- https://github.com/lewis6991/gitsigns.nvim
	use({ "lewis6991/gitsigns.nvim" })

	-- DAP
	use({ "mfussenegger/nvim-dap" })
	use({ "rcarriga/nvim-dap-ui" })
	use({ "ravenxrz/DAPInstall.nvim" })

	-- Web development
	-- https://github.com/windwp/nvim-ts-autotag
	use({ "windwp/nvim-ts-autotag" })

	-- Automatically set up your configuration after cloning packer.nvim
	-- Put this at the end after all plugins
	if PACKER_BOOTSTRAP then
		require("packer").sync()
	end
end)
