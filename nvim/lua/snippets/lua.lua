local ls = require("luasnip")
local s = ls.snippet
local fmt = require("luasnip.extras.fmt").fmt
local i = ls.insert_node
local rep = require("luasnip.extras").rep

local snippets = {
	s("ex", fmt("expanded now", {}), {}),
	ls.parser.parse_snippet("jf", "local $1 = function($2)\n  $0\nend"),
	s("req", fmt('local {} = require("{}")', { i(1, "name"), rep(1) })),
}

ls.add_snippets("lua", snippets)
