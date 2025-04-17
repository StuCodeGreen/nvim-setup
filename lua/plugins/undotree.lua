return {
  {
    "mbbill/undotree",
    cmd = "UndotreeToggle", -- Lazy-load when you run the command
    keys = {
      { "<leader>u", vim.cmd.UndotreeToggle, desc = "Toggle Undotree" },
    },
  },
}
