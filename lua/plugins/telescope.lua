return {
	"nvim-telescope/telescope.nvim",
	tag = "0.1.5",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-telescope/telescope-live-grep-args.nvim",
	},

	config = function()
		local telescope = require("telescope")

		telescope.setup({
			defaults = {
				vimgrep_arguments = {
					"rg",
					"--color=never",
					"--no-heading",
					"--with-filename",
					"--line-number",
					"--column",
					"--smart-case",
					"--hidden",
					"--fixed-strings",
					"--glob",
					"!.git/",
					"--glob",
					"!node_modules/",
				},
				file_ignore_patterns = { "node_modules", ".git" },
			},
		})

		telescope.load_extension("live_grep_args")

		local builtin = require("telescope.builtin")

		-- Keymaps
		vim.keymap.set("n", "<leader>pf", builtin.find_files, {})
		vim.keymap.set("n", "<C-p>", builtin.git_files, {})

		-- Literal search with live_grep_args
		vim.keymap.set("n", "<leader>pws", function()
			telescope.extensions.live_grep_args.live_grep_args({
				additional_args = function()
					return { "--fixed-strings" }
				end,
			})
		end, { desc = "Live grep literal" })

		-- Search current word
		vim.keymap.set("n", "<leader>pWs", function()
			local word = vim.fn.expand("<cWORD>")
			builtin.grep_string({ search = word })
		end, { desc = "Grep current word" })

		-- Normal live grep (regex if needed)
		vim.keymap.set("n", "<leader>ps", builtin.live_grep, { desc = "Live grep" })
		vim.keymap.set("n", "<leader>vh", builtin.help_tags, { desc = "Help tags" })

		-- Search in current buffer
		vim.keymap.set("n", "<C-f>", function()
			local buftype = vim.api.nvim_buf_get_option(0, "buftype")
			if buftype ~= "" then
				print("Not a searchable buffer.")
				return
			end
			builtin.current_buffer_fuzzy_find()
		end, {})
	end,
}
