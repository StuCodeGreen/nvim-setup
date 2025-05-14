-- plugins/telekasten.lua
return {
  "renerocksai/telekasten.nvim",
  dependencies = {
    "nvim-telescope/telescope.nvim",
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope-media-files.nvim",
  },
  config = function()
    local home = vim.fn.expand("~/notes")

    require("telekasten").setup({
      home = home,
      dailies = "daily",
      weeklies = "weekly",
      template_new_daily = home .. "/templates/daily.md",
      auto_set_filetype = false,
      take_over_my_home = false,
    })

    -- Keymaps
    local tk = require("telekasten")
    vim.keymap.set("n", "<leader>zn", tk.goto_today, { desc = "Today's note" })
    vim.keymap.set("n", "<leader>zd", tk.find_daily_notes, { desc = "Find daily notes" })
    vim.keymap.set("n", "<leader>zz", tk.panel, { desc = "Telekasten panel" })
  end,
}
