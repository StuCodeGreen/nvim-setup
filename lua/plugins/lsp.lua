-- lua/plugins/lsp.lua
return {
	{
		"VonHeikemen/lsp-zero.nvim",
		branch = "v3.x",
		dependencies = {
			-- LSP Support
			"neovim/nvim-lspconfig",
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",

			-- Autocompletion
			"hrsh7th/nvim-cmp",
			"hrsh7th/cmp-nvim-lsp",
		},
		config = function()
			local lsp = require("lsp-zero")
			lsp.extend_lspconfig()

			local capabilities = require("cmp_nvim_lsp").default_capabilities()

			local function on_attach(client, bufnr)
				client.server_capabilities.documentFormattingProvider = false

				local opts = { buffer = bufnr }
				vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
				vim.keymap.set("n", "<leader>im", function()
					vim.lsp.buf.code_action({
						filter = function(action)
							return action.title:match("Import") or action.title:match("Add")
						end,
						apply = true,
					})
				end, opts)
			end

			-- HTML
			require("lspconfig").html.setup({
				capabilities = capabilities,
				on_attach = on_attach,
			})

			-- TypeScript (ts_ls) with handler override
			require("lspconfig").ts_ls.setup({
				capabilities = capabilities,
				on_attach = on_attach,
				handlers = {
					["textDocument/codeAction"] = function(err, result, ctx, config)
						if result then
							result = vim.tbl_filter(function(action)
								return action.title ~= "Move to a new file"
							end, result)
						end
						vim.lsp.handlers["textDocument/codeAction"](err, result, ctx, config)
					end,
				},
			})

			lsp.setup()
		end,
	},
}

