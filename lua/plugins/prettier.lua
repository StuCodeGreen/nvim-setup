return {
	"nvimtools/none-ls.nvim",
	dependencies = { "nvim-lua/plenary.nvim" },
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local null_ls = require("null-ls")

		null_ls.setup({
			sources = {
				null_ls.builtins.formatting.prettier.with({
					filetypes = {
						"javascript",
						"typescript",
						"javascriptreact",
						"typescriptreact",
						"json",
						"html",
						"css",
						"scss",
						"markdown",
					},
					prefer_local = "node_modules/.bin",
					extra_args = {
						"--single-quote",
						"--print-width",
						"80",
						"--arrow-parens",
						"always",
						"--trailing-comma",
						"all",
					},
				}),
				null_ls.builtins.formatting.stylua.with({
					filetypes = { "lua" },
				}),
			},
			on_attach = function(client, bufnr)
				if client.supports_method("textDocument/formatting") then
					vim.api.nvim_create_autocmd("BufWritePre", {
						buffer = bufnr,
						callback = function()
							vim.lsp.buf.format({ bufnr = bufnr })
						end,
					})
				end
			end,
		})
	end,
}
