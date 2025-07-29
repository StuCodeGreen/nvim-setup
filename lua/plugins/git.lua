return {
	-- Git signs in the gutter
	{
		"lewis6991/gitsigns.nvim",
		event = { "BufReadPre", "BufNewFile" },
		opts = {
			signs = {
				add = { text = "+" },
				change = { text = "~" },
				delete = { text = "_" },
				topdelete = { text = "‾" },
				changedelete = { text = "~" },
			},
			current_line_blame = true, -- optional

			on_attach = function(bufnr)
				local gs = package.loaded.gitsigns
				local function map(mode, lhs, rhs, desc)
					vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, desc = desc })
				end

				-- Navigation between hunks
				map("n", "]c", function()
					if vim.wo.diff then
						return "]c"
					end
					vim.schedule(gs.next_hunk)
					return "<Ignore>"
				end, "Next Git hunk")

				map("n", "[c", function()
					if vim.wo.diff then
						return "[c"
					end
					vim.schedule(gs.prev_hunk)
					return "<Ignore>"
				end, "Previous Git hunk")

				-- Actions
				map("n", "<leader>hs", gs.stage_hunk, "Stage hunk")
				map("n", "<leader>hu", gs.undo_stage_hunk, "Undo stage hunk")
				map("n", "<leader>hr", gs.reset_hunk, "Reset hunk")
				map("n", "<leader>hR", gs.reset_buffer, "Reset buffer")
				map("n", "<leader>hp", gs.preview_hunk, "Preview hunk")
				map("n", "<leader>hb", function()
					gs.blame_line({ full = true })
				end, "Blame line (full)")
				map("n", "<leader>hd", gs.diffthis, "Diff this file")
			end,
		},
	},

	-- LazyGit integration
	{
		"kdheepak/lazygit.nvim",
		cmd = "LazyGit",
		dependencies = { "nvim-lua/plenary.nvim" },
		keys = {
			{ "<leader>gg", "<cmd>LazyGit<cr>", desc = "Open LazyGit" },
		},
	},
}
