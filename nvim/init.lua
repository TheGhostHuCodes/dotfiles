-- LEADER
vim.g.mapleader = ","
vim.g.localleader = "\\"

-- IMPORTS
require("vars")
require("opts")
require("keymappings")
require("plugins")

-- PLUGINS
require("nvim-tree").setup()
require("lualine").setup({
	options = {
		theme = "solarized_dark",
	},
})
