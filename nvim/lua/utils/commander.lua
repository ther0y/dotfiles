local M = {}

function M.execute(command)
	local lines = {}
	local file = io.popen(command)
	for line in file:lines() do
		table.insert(lines, line)
	end
	file:close()

	print("Executed this command:" .. command)

	return lines
end

return M
