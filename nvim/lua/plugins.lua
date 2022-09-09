require("packer").startup({
	function(use)
		-- [[ Put Plugins Here ]]
		use("wbthomason/packer.nvim")
		use({
			"kyazdani42/nvim-tree.lua",
			requires = "kyazdani42/nvim-web-devicons",
		})
		use({ "nvim-lualine/lualine.nvim", requires = { "kyazdani42/nvim-web-devicons", opt = true } })
		use("overcache/NeoSolarized")
	end,
	config = {
		package_root = vim.fn.stdpath("config") .. "/site/pack",
	},
})
