local opt = vim.opt

-- [[ Context ]]
opt.colorcolumn = "80"
opt.number = true
opt.relativenumber = true
-- Minimal number of screen lines to keep above and below the cursor.
opt.scrolloff = 4
opt.signcolumn = "yes"

-- [[ Filetypes ]]
opt.encoding = "utf8"
opt.fileencoding = "utf8"

-- [[ Theme ]]
opt.syntax = "ON"
opt.termguicolors = true
vim.cmd("colorscheme NeoSolarized")
-- Use the Solarized Dark theme instead of Solarized Light.
opt.background = "dark"

-- [[ Search ]]
opt.ignorecase = true
opt.smartcase = true
opt.incsearch = true
opt.hlsearch = true

-- [[ Whitespace ]]
opt.expandtab = true
opt.shiftwidth = 4
opt.softtabstop = 4
opt.tabstop = 4

-- [[ Splits ]]
opt.splitright = true
opt.splitbelow = true

-- [[ Clipboard ]]
-- Use the + register (system clipboard) instead of the regular unnamed
-- register. The regular unnamed register can only be accessed from inside vim.
opt.clipboard = "unnamedplus"
