require("nvim-tree").setup({
	sort_by = "case_sensitive",
	focus_empty_on_setup = false,
	disable_netrw = true,
	open_on_setup = true,
	--open_on_setup_file = true,
	view = {
		adaptive_size = true,
		mappings = {
			list = {
				{ key = "u", action = "dir_up" },
			},
		},
	},
	renderer = {
		group_empty = true,
	},
	filters = {
		dotfiles = true,
	},
})
vim.keymap.set("n", "<C-n>", "<cmd>NvimTreeToggle<cr>")
