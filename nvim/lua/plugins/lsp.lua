local lspconfig = require("lspconfig")
local capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())

local function on_attach()
	vim.keymap.set("n", "K", vim.lsp.buf.hover, { buffer = 0 })
	vim.keymap.set("n", "gd", vim.lsp.buf.definition, { buffer = 0 })
	vim.keymap.set("n", "ca", vim.lsp.buf.code_action, { buffer = 0 })
	vim.keymap.set("n", "gT", vim.lsp.buf.type_definition, { buffer = 0 })
	vim.keymap.set("n", "gi", vim.lsp.buf.implementation, { buffer = 0 })
	vim.keymap.set("n", "<leader>df", vim.diagnostic.goto_next, { buffer = 0 })
end

lspconfig.tsserver.setup({
	on_attach = on_attach,
	capabilities = capabilities,
})

--lspconfig.angularls.setup({})

lspconfig.sumneko_lua.setup({
	on_attach = on_attach,
	capabilities = capabilities,
})

lspconfig.graphql.setup({})

lspconfig.gopls.setup({
	on_attach = on_attach,
	capabilities = capabilities,
})

--local languageServerPath = "/Users/masood/.nvm/versions/node/v16.15.0/libV
--local cmd = {"ngserver", "--stdio", "--tsProbeLocations", languageServerPath , "--ngProbeLocations", languageServerPath}

--lspconfig.angularls.setup{
--on_attach = on_attach,
--capabilities = capabilities,
--cmd = cmd,
--on_new_config = function(new_config, new_root_dir)
--new_config.cmd = cmd
--end,
--}
