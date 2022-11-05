local nvim_treesitter = require("nvim-treesitter")
local options = {
	mouse = "a",
	path = vim.opt.path + "**",
	wildmenu = true,
	incsearch = true,
	backup = false,
	swapfile = false,
	number = true,
	relativenumber = true,
	tabstop = 4,
	shiftwidth = 4,
	expandtab = true,
	colorcolumn = "80",
	splitbelow = true,
	splitright = true,
	termguicolors = true,
	listchars = "eol:¬,tab:>-,trail:~,extends:>,precedes:<,space:␣",
	foldmethod = "syntax",
	--foldmethod="expr",
	--foldexpr=nvim_treesitter#foldexpr(),
	foldnestmax = 3,
	foldminlines = 1,
}

--set foldmethod=expr
--set foldexpr=nvim_treesitter#foldexpr()

for key, value in pairs(options) do
	vim.opt[key] = value
end
