local options = {
	mouse = "a",
	path = vim.opt.path + "**",
	wildmenu = true,
	incsearch = true,
	backup = false,
	swapfile = false,
	relativenumber = true,
	tabstop = 4,
	shiftwidth = 4,
	expandtab = true,
	colorcolumn = "80",
	splitbelow = true,
	splitright = true,
	termguicolors = true,
	listchars = "eol:¬,tab:>-,trail:~,extends:>,precedes:<,space:␣",
}

for key, value in pairs(options) do
	vim.opt[key] = value
end
