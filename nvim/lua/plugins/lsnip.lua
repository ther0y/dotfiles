local ls = require("luasnip")
local types = require("luasnip.util.types")

ls.config.set_config({
	history = true,

	updateevents = "TextChanged,TextChangedI",

	enable_autosnippets = true,

	expt_opts = {
		[types.choiceNode] = {
			active = {
				virt_text = { { "<-", "Error" } },
			},
		},
	},
})

--vim.keymap.set({ "i", "s" }, "<s-k>", function()
--if ls.expand_or_jumpable() then
--ls.expand_or_jump()
--end
--end, { silent = false, noremap = true })

--vim.keymap.set({ "i", "s" }, "<s-j>", function()
--if ls.jumpable(-1) then
--ls.jump(-1)
--end
--end, { silent = true })

--vim.keymap.set({ "i", "s" }, "<s-l>", function()
--if ls.choice_active() then
--ls.change_choice(1)
--end
--end, { silent = true })

--vim.keymap.set({ "i", "s" }, "<s-h>", function()
--if ls.choice_active() then
--ls.change_choice(-1)
--end
--end, { silent = true })

vim.keymap.set("n", "<leader><leader>s", "<smd>source ~/.config/nvim/lua/plugins/luasnip.lua<sr>")

require("snippets")
