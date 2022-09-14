-- LEADER
vim.g.mapleader = ","
vim.g.localleader = "\\"

-- IMPORTS
require("vars")
require("options")
require("keymappings")
require("plugins")

-- PLUGINS
-- nvim-tree setup.
require("nvim-tree").setup()

-- lualine setup.
require("lualine").setup({
	options = {
		theme = "solarized_dark",
	},
})

-- nvim-orgmode setup.
-- Load custom tree-sitter grammar for org filetype
require("orgmode").setup_ts_grammar()
-- Tree-sitter configuration
require("nvim-treesitter.configs").setup({
	-- If TS highlights are not enabled at all, or disabled via `disable` prop,
	-- highlighting will fallback to default Vim syntax highlighting.
	highlight = {
		enable = true,
		-- Required for spellcheck, some LaTeX highlights and code block
		-- highlights that do not have ts grammar.
		additional_vim_regex_highlighting = { "org" },
	},
	ensure_installed = { "org", "python", "rust" }, -- Or run :TSUpdate org
})
require("orgmode").setup({
	org_agenda_files = "~/org/*",
	org_default_notes_file = "~/org/refile.org",
})
require("orgmode").setup()
