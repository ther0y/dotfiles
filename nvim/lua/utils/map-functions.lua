local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

function nmap(key, action, options)
	keymap("n", key, action, TableMerge({ table.unpack(opts) }, options or {}))
end

function vmap(key, action, options)
	options = options or opts
	keymap("v", key, action, TableMerge({ table.unpack(opts) }, options or {}))
end

function xmap(key, action, options)
	options = options or opts
	keymap("x", key, action, TableMerge({ table.unpack(opts) }, options or {}))
end

function imap(key, action, options)
	options = options or opts
	keymap("i", key, action, TableMerge({ table.unpack(opts) }, options or {}))
end

function omap(key, action, options)
	options = options or opts
	keymap("o", key, action, TableMerge({ table.unpack(opts) }, options or {}))
end

function tmap(key, action, options)
	options = options or opts
	keymap("t", key, action, TableMerge({ table.unpack(opts) }, options or {}))
end

function cmap(key, action, options)
	options = options or opts
	keymap("c", key, action, TableMerge({ table.unpack(opts) }, options or {}))
end
