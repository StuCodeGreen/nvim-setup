return {
	{
		"ThePrimeagen/harpoon",
		branch = "harpoon2",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			local harpoon = require("harpoon")
			harpoon:setup({
				global_settings = {
					save_on_toggle = true,
					save_on_change = true,
					mark_branch = true,
				},
			})

			local list = harpoon:list()

			-- Add & navigate files
			vim.keymap.set("n", "<leader>a", function()
				list:add()
			end, { desc = "Harpoon: Add file" })
			vim.keymap.set("n", "<leader>1", function()
				list:select(1)
			end)
			vim.keymap.set("n", "<leader>2", function()
				list:select(2)
			end)
			vim.keymap.set("n", "<leader>3", function()
				list:select(3)
			end)
			vim.keymap.set("n", "<leader>4", function()
				list:select(4)
			end)
			vim.keymap.set("n", "<A-,>", function()
				list:prev()
			end, { desc = "Harpoon: Prev file" })
			vim.keymap.set("n", "<A-.>", function()
				list:next()
			end, { desc = "Harpoon: Next file" })

			-- Harpoon's built-in quick menu
			vim.keymap.set("n", "<leader>e", function()
				harpoon.ui:toggle_quick_menu(list)
			end, { desc = "Harpoon: Open quick menu" })

			-- Telescope-powered menu
			local conf = require("telescope.config").values
			local function toggle_telescope(harpoon_list)
				local file_paths = {}
				for _, item in ipairs(harpoon_list.items) do
					table.insert(file_paths, item.value)
				end

				require("telescope.pickers")
					.new({}, {
						prompt_title = "Harpoon Files",
						finder = require("telescope.finders").new_table({
							results = file_paths,
						}),
						previewer = conf.file_previewer({}),
						sorter = conf.generic_sorter({}),
					})
					:find()
			end

			vim.keymap.set("n", "<C-e>", function()
				toggle_telescope(list)
			end, { desc = "Harpoon: Telescope menu" })
		end,
	},
}
