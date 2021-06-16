local onAttach = require'lsp/lsp-attach'

require'lspconfig'.tsserver.setup{
  on_attach = onAttach
}
