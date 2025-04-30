return {
  {
    "nvim-tree/nvim-tree.lua",
    dependencies = { "nvim-tree/nvim-web-devicons" }, -- icons
    cmd = { "NvimTreeToggle", "NvimTreeFocus" }, -- lazy load
    keys = {
      { "<leader>nt", "<cmd>NvimTreeToggle<CR>", desc = "Toggle NvimTree" },
      { "<leader>nf", "<cmd>NvimTreeFocus<CR>", desc = "Focus NvimTree" },
    },
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
    end,
  },
}
