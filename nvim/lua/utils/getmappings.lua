vim.cmd([[
function! GetMappings()
	let lines=MinExec('map')
	let lines=split(lines,'\n')
	return lines
endfunction
]])
