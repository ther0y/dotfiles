require("bufferline").setup({
	options = {
		mode = "tabs",
		close_command = "bdelete! %d",
		offsets = {
			{
				filetype = "NvimTree",
				text = "File Explorer",
				highlight = "Directory",
				separator = true, -- use a "true" to enable the default, or set your own character
			},
		},
	},
})
