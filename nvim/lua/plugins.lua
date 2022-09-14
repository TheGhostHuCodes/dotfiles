require("packer").startup({
	function(use)
		-- neovim package manager written in lua.
		use("wbthomason/packer.nvim")
		-- neovim filetree UI.
		use({
			"kyazdani42/nvim-tree.lua",
			requires = "kyazdani42/nvim-web-devicons",
		})
		-- neovim status line.
		use({ "nvim-lualine/lualine.nvim", requires = { "kyazdani42/nvim-web-devicons", opt = true } })
		-- Solarized color scheme.
		use("overcache/NeoSolarized")
		-- Treesitter for better parsing.
		use({ "nvim-treesitter/nvim-treesitter" })
		-- neovim port of orgmode.
		use({
			"nvim-orgmode/orgmode",
			config = function()
				require("orgmode").setup({})
			end,
		})
	end,
	config = {
		package_root = vim.fn.stdpath("config") .. "/site/pack",
	},
})
