local actions = require("telescope.actions")
local action_state = require("telescope.actions.state")
local finders = require("telescope.finders")
local make_entry = require("telescope.make_entry")
local pickers = require("telescope.pickers")
local sorters = require("telescope.sorters")
local previewers = require("telescope.previewers")
local utils = require("telescope.utils")
local entry_display = require("telescope.pickers.entry_display")
local strings = require("plenary.strings")
local Path = require("plenary.path")

local commander = require("utils.commander")
local conf = require("telescope.config").values
local flatten = vim.tbl_flatten
local filter = vim.tbl_filter

local opts = {}

local search_changed_files = function(opts)
	local vimgrep_arguments = opts.vimgrep_arguments or conf.vimgrep_arguments
	local search_dirs = opts.search_dirs
	local grep_open_files = opts.grep_open_files
	opts.cwd = opts.cwd and vim.fn.expand(opts.cwd) or vim.loop.cwd()

	--local filelist = get_open_filelist(grep_open_files, opts.cwd)
	--if search_dirs then
	--for i, path in ipairs(search_dirs) do
	--search_dirs[i] = vim.fn.expand(path)
	--end
	--end

	local additional_args = {}
	if opts.additional_args ~= nil and type(opts.additional_args) == "function" then
		additional_args = opts.additional_args(opts)
	end

	if opts.type_filter then
		additional_args[#additional_args + 1] = "--type=" .. opts.type_filter
	end

	if type(opts.glob_pattern) == "string" then
		additional_args[#additional_args + 1] = "--glob=" .. opts.glob_pattern
	elseif type(opts.glob_pattern) == "table" then
		for i = 1, #opts.glob_pattern do
			additional_args[#additional_args + 1] = "--glob=" .. opts.glob_pattern[i]
		end
	end

	local live_grepper = function(opts)
		return finders.new_job(function(prompt)
			-- TODO: Probably could add some options for smart case and whatever else rg offers.

			if not prompt or prompt == "" then
				return nil
			end

			local search_list = {}

			if grep_open_files then
				search_list = filelist
			elseif search_dirs then
				search_list = search_dirs
			end
			return flatten({
				vimgrep_arguments,
				additional_args,
				"--",
				prompt,
				{
					"git",
					"status",
					"--short",
					"-u",
					"--",
					".",
				},
			})
		end, make_entry.gen_from_vimgrep(opts), opts.max_results, opts.cwd)
	end

	pickers
		.new(opts, {
			prompt_title = "Search in changed files...",
			finder = live_grepper,
			--finder = finders.new_oneshot_job(vim.tbl_flatten({
			--"git",
			--"status",
			--"--short",
			--"-u",
			--"--",
			--".",
			--})),
			previewer = conf.grep_previewer(opts),
			sorter = sorters.highlighter_only(opts),
			attach_mappings = function(_, map)
				map("i", "<c-space>", actions.to_fuzzy_refine)
				return true
			end,
		})
		:find()
end

-- to execute the function
search_changed_files(opts)
