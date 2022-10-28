local nvimTree = require("nvim-tree")

function string:split(sSeparator, nMax, bRegexp)
	assert(sSeparator ~= "")

	assert(nMax == nil or nMax >= 1)

	local aRecord = {}

	if self:len() > 0 then
		local bPlain = not bRegexp

		nMax = nMax or -1

		local nField = 1
		local nStart = 1

		print(sSeparator, nStart, bPlain)
		local nFirst, nLast = self:find(sSeparator, nStart, bPlain)

		while nFirst and nMax ~= 0 do
			aRecord[nField] = self:sub(nStart, nFirst - 1)

			nField = nField + 1

			nStart = nLast + 1

			nFirst, nLast = self:find(sSeparator, nStart, bPlain)

			nMax = nMax - 1
		end

		aRecord[nField] = self:sub(nStart)
	end

	return aRecord
end

nvimTree.setup({
	on_attach = function()
		local inject_node = require("nvim-tree.utils").inject_node
		nmap("<a-o>", "<cmd>NvimTreeFindFile<cr>")

		vim.keymap.set(
			"n",
			"<leader>F",
			inject_node(function(node)
				if node then
					local dir = node.absolute_path .. "/"
					if node.type ~= "directory" then
						dir = node.absolute_path:match("(.*/).*")
					end
					print(Dump(dir))
					require("telescope.builtin").grep_string({
						search_dirs = { dir },
						search = "",
					})
				end
			end),
			{ buffer = bufnr, noremap = true, desc = "Search in current path" }
		)

		--vim.bo[bufnr].path = "/tmp"
	end,
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
