return {
	"nvim-telescope/telescope.nvim",

	tag = "0.1.5",

	dependencies = {
		"nvim-lua/plenary.nvim"
	},

	config = function()
		require('telescope').setup({})

		local builtin = require('telescope.builtin')
		vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
		vim.keymap.set('n', '<C-p>', builtin.git_files, {})
		vim.keymap.set('n', '<leader>pws', function()
			local word = vim.fn.expand("<cword>")
			builtin.grep_string({ search = word })
		end)
		vim.keymap.set('n', '<leader>pWs', function()
			local word = vim.fn.expand("<cWORD>")
			builtin.grep_string({ search = word })
		end)
		vim.keymap.set('n', '<leader>ps', builtin.live_grep, {})
		vim.keymap.set('n', '<leader>vh', builtin.help_tags, {})
		vim.keymap.set('n', '<C-f>', function()
  local buftype = vim.api.nvim_buf_get_option(0, 'buftype')
  if buftype ~= '' then
    print("Not a searchable buffer.")
    return
  end
  require('telescope.builtin').current_buffer_fuzzy_find()
end, {})
	end
}
