-- lua/plugins/mason.lua
return {
  {
    "williamboman/mason.nvim",
    build = ":MasonUpdate",
    config = true,
    cmd = "Mason", -- ensures Mason loads when you run :Mason
  },
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = { "williamboman/mason.nvim" },
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = { "ts_ls", "html", "lua_ls" }, -- or whatever LSPs you want
        automatic_installation = true,
      })
    end,
  },
}
