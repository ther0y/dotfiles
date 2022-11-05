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
		-- formatting
		nls.builtins.formatting.stylua,
		nls.builtins.formatting.prettier.with({
			command = function()
				return "prettier"
			end,
		}),
		nls.builtins.formatting.gofmt,
		nls.builtins.formatting.goimports,
		nls.builtins.formatting.black,
		nls.builtins.formatting.codespell,
		-- diagnostics
		nls.builtins.diagnostics.eslint,
		nls.builtins.diagnostics.golangci_lint,
		nls.builtins.diagnostics.actionlint,
		nls.builtins.diagnostics.ansiblelint,
		--nls.builtins.diagnostics.codespell,
		--nls.builtins.diagnostics.cspell,
		--nls.builtins.diagnostics.cspell,
		nls.builtins.diagnostics.flake8,
		nls.builtins.diagnostics.luacheck,
		nls.builtins.diagnostics.stylint,
		nls.builtins.diagnostics.tidy,
		nls.builtins.diagnostics.tsc,
		-- completion
		nls.builtins.completion.luasnip,
		nls.builtins.completion.spell,
		-- code Actions
		--nls.builtins.code_actions.refactoring,
		nls.builtins.code_actions.eslint,
		nls.builtins.code_actions.gitsigns,
		nls.builtins.code_actions.shellcheck,
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
						filter = function(c)
							return c.name == "null-ls"
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
