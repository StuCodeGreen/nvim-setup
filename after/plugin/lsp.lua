local lsp = require('lsp-zero')

lsp.configure('html', {
    -- You can add any options you need here
    on_attach = function(client, bufnr)
        -- Custom on_attach settings (if any)
    end,
    capabilities = require('cmp_nvim_lsp').default_capabilities(), -- If you're using nvim-cmp
})

lsp.setup()

