local lsp = require('lsp-zero')

lsp.configure('html', {
    -- You can add any options you need here
    on_attach = function(client, bufnr)
        -- Custom on_attach settings (if any)
    end,
    capabilities = require('cmp_nvim_lsp').default_capabilities(), -- If you're using nvim-cmp
})

-- Configure tsserver
lsp.configure('ts_ls', {
    on_attach = function(client, bufnr)
        -- Custom settings if needed for JavaScript
        -- For example, disable document formatting if you're using Prettier
        client.server_capabilities.documentFormattingProvider = false
    end,
    capabilities = require('cmp_nvim_lsp').default_capabilities(),
})
lsp.setup()

