local M = {}

local Terminal = require("toggleterm.terminal").Terminal

local git_tui = "lazygit"
-- local git_tui = "gitui"

local floating_terminal = function(cmd)
	return Terminal:new({
		cmd = cmd or "$SHELL",
		hidden = true,
		direction = "float",
		float_opts = {
			border = "double",
		},
	})
end

function M.floating_terminal_toggle()
	floating_terminal():toggle()
end

function M.htop_toggle()
	floating_terminal("htop"):toggle()
end

function M.btop_toggle()
	floating_terminal("btop"):toggle()
end

function M.git_client_toggle()
	floating_terminal(git_tui):toggle()
end

return M
