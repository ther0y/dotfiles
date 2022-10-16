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
	foldnestmax = 3,
	foldminlines = 1,
}

for key, value in pairs(options) do
	vim.opt[key] = value
end
