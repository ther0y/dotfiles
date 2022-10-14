vim.cmd([[
function! MinExec(cmd)
	redir @a
	exec printf('silent %s',a:cmd)
	redir END
	return @a
endfunction
]])
