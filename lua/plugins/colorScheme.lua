return {
  {
    "rose-pine/neovim",
    name = "rose-pine", -- this allows `require("rose-pine")` to work
    priority = 1000, -- ensures it's loaded before other UI plugins
    config = function()
      require("rose-pine").setup({
        dark_variant = "main", -- or 'moon', 'dawn'
        bold_vert_split = false,
        dim_nc_background = false,
        disable_background = true,
        disable_float_background = true,
        disable_italics = false,
      })

      -- Set the colorscheme
      vim.cmd("colorscheme rose-pine")
    end,
  },
}
