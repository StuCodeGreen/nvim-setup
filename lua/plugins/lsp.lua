-- lua/plugins/lsp.lua
return {
  {
    "VonHeikemen/lsp-zero.nvim",
    branch = "v3.x",
    dependencies = {
      -- LSP Support
      "neovim/nvim-lspconfig",
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",

      -- Autocompletion
      "hrsh7th/nvim-cmp",
      "hrsh7th/cmp-nvim-lsp",
    },
    config = function()
      local lsp = require("lsp-zero")

      lsp.extend_lspconfig()

      -- Common capabilities
      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      -- HTML LSP
      require("lspconfig").html.setup({
        capabilities = capabilities,
        on_attach = function(client, bufnr)
          -- Custom html LSP on_attach logic
        end,
      })

      -- TypeScript LSP (tsserver or tsserver from mason)
      require("lspconfig").ts_ls.setup({
        capabilities = capabilities,
        on_attach = function(client, bufnr)
          client.server_capabilities.documentFormattingProvider = false
        end,
      })

      lsp.setup()
    end,
  },
}
