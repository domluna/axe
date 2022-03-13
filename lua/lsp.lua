local cmp = require'cmp'

cmp.setup({
  snippet = {
    -- REQUIRED - you must specify a snippet engine
    expand = function(args)
      require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
    end,
  },
  mapping = {
    ['<C-b>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
    ['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
    ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
    ['<C-y>'] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
    ['<C-e>'] = cmp.mapping({
      i = cmp.mapping.abort(),
      c = cmp.mapping.close(),
    }),
    ['<CR>'] = cmp.mapping.confirm({ select = true }),
  },
  sources = {
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
    { name = 'path' },
    { name = 'buffer' },
  },
})

-- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline('/', {
  sources = {
    { name = 'buffer' }
  }
})

-- Enable inline errors
vim.lsp.handlers["textDocument/publishDiagnostics"] =
    vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics,
      {update_in_insert = true})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
-- cmp.setup.cmdline(':', {
--   sources = cmp.config.sources({
--     { name = 'path' }
--   }, {
--     { name = 'cmdline' }
--   })
-- })

-- Setup lspconfig.
local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())

local lspconfig = require('lspconfig')

lspconfig.gopls.setup {
  capabilities = capabilities,
  completeUnimported = true,
  staticcheck = true,
  analyses = {unusedparams = true},
}
lspconfig.rust_analyzer.setup {
  capabilities = capabilities,
}
lspconfig.tsserver.setup {
  capabilities = capabilities,
}
lspconfig.pyright.setup {
  capabilities = capabilities,
  on_attach = on_attach,
}
lspconfig.solargraph.setup {
  capabilities = capabilities,
}

-- require'nvim-treesitter.configs'.setup {
--   -- One of "all", "maintained" (parsers with maintainers), or a list of languages
--   ensure_installed = "maintained",
-- 
--   -- Install languages synchronously (only applied to `ensure_installed`)
--   sync_install = false,
-- 
--   -- List of parsers to ignore installing
--   ignore_install = { "javascript", "julia" },
-- 
--   highlight = {
--     -- `false` will disable the whole extension
--     enable = true,
-- 
--     -- list of language that will be disabled
--     disable = { "c", "rust" },
-- 
--     -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
--     -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
--     -- Using this option may slow down your editor, and you may see some duplicate highlights.
--     -- Instead of true it can also be a list of languages
--     additional_vim_regex_highlighting = false,
--   },
-- }
