-- lua/plugins/emmet.lua
return {
  {
    "aca/emmet-ls",
    ft = { "html", "css", "javascriptreact", "typescriptreact" },
    config = function()
      require("lspconfig").emmet_ls.setup({
        capabilities = require("cmp_nvim_lsp").default_capabilities(),
        filetypes = {
          "html",
          "css",
          "javascriptreact",
          "typescriptreact",
          "svelte",
          "vue",
        },
      })
    end,
  },
}
