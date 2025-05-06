return {
	{
		"folke/which-key.nvim",
		"nvim-tree/nvim-web-devicons",
		lazy = true,
		event = "VeryLazy", -- loads after your other plugins/keymaps
		config = function()
			require("which-key").setup({
				plugins = {
					marks = true,
					registers = true,
					spelling = {
						enabled = true,
						suggestions = 20,
					},
				},
				win = {
					border = "rounded",
				},
				layout = {
					spacing = 4,
				},
				triggers = "auto", -- Automatically detect leader keymaps
			})

			-- Optional: group your keybindings for visual grouping
			local wk = require("which-key")
			wk.register({
				-- { "<leader>f", group = "file" },
				{ "<leader>g", group = "git" },
				{ "<leader>h", group = "harpoon" },
			})
		end,
	},
}
