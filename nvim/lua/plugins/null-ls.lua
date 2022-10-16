local nls = require("null-ls")

--nls.setup({
--sources = {
--nls.builtins.formatting.stylua,
--nls.builtins.formatting.prettier,
--nls.builtins.diagnostics.eslint,
--nls.builtins.completion.spell,
--},
--})

-- auto forrmat on save
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
require("null-ls").setup({
	sources = {
		nls.builtins.formatting.stylua,
		nls.builtins.formatting.prettier,
		nls.builtins.diagnostics.eslint,
		nls.builtins.completion.spell,
	},
	-- you can reuse a shared lspconfig on_attach callback here
	on_attach = function(client, bufnr)
		if client.supports_method("textDocument/formatting") then
			vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
			vim.api.nvim_create_autocmd("BufWritePre", {
				group = augroup,
				buffer = bufnr,
				callback = function()
					-- on 0.8, you should use vim.lsp.buf.format({ bufnr = bufnr }) instead
					vim.lsp.buf.format({
						bufnr = bufnr,
						filter = function(client)
							return client.name == "null-ls"
						end,
					})
				end,
			})
		end
	end,
})

--vim.api.nvim_create_autocmd("BufWritePre", {
--pattern = "*",
--group = augroup,
--command = "lua vim.lsp.buf.format()",
--})
