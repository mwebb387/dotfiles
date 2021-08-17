local onAttach = require'lsp/lsp-attach'

--Enable (broadcasting) snippet capability for completion
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

require'lspconfig'.cssls.setup{
  cmd = { "vscode-css-language-server.cmd", "--stdio" },
  capabilities = capabilities,
  on_attach = onAttach
}
