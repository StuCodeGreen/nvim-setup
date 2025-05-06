return {
	{
		"nvim-tree/nvim-tree.lua",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			require("nvim-tree").setup({
				view = {
					width = 35,
					side = "left",
				},
				filters = {
					dotfiles = false,
				},
				git = {
					enable = true,
				},
			})
			-- Auto-open nvim-tree on startup
			local function open_nvim_tree_on_startup(data)
				local IGNORED_FT = {
					"gitcommit",
					"markdown",
					"gitrebase",
					"svn",
					"hgcommit",
				}

				if vim.tbl_contains(IGNORED_FT, vim.bo[data.buf].filetype) then
					return
				end

				local is_directory = vim.fn.isdirectory(data.file) == 1
				if is_directory then
					vim.cmd.cd(data.file)
				end

				require("nvim-tree.api").tree.open()
			end

			vim.api.nvim_create_autocmd("VimEnter", {
				callback = open_nvim_tree_on_startup,
			})
			-- Auto-quit Neovim when nvim-tree is the last window
			vim.api.nvim_create_autocmd("BufEnter", {
				group = vim.api.nvim_create_augroup("NvimTreeAutoQuit", { clear = true }),
				callback = function()
					local wins = vim.api.nvim_list_wins()
					local is_only_tree = true

					for _, win in ipairs(wins) do
						local bufname = vim.api.nvim_buf_get_name(vim.api.nvim_win_get_buf(win))
						if not bufname:match("NvimTree_") then
							is_only_tree = false
							break
						end
					end

					if is_only_tree then
						vim.cmd("quit")
					end
				end,
			})
		end,
	},
}
