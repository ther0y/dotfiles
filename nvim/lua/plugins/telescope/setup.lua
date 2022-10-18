require("telescope").load_extension("fzf")
require("telescope").load_extension("project")
require("telescope").load_extension("repo")

local actions = require("telescope.actions")
local trouble = require("trouble.providers.telescope")
local telescope = require("telescope")
telescope.setup({
	defaults = {
		mappings = {
			i = { ["<c-t>"] = trouble.open_with_trouble },
			n = { ["<c-t>"] = trouble.open_with_trouble },
		},
	},
})
