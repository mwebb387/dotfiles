local onAttach = require'lsp/lsp-attach'

vim.lsp.set_log_level("debug")

local pid = vim.fn.getpid()
-- on Windows
local home = vim.fn.expand('~')
local omnisharp_bin = home .. [[\scoop\apps\omnisharp\current\OmniSharp.exe]]
require'lspconfig'.omnisharp.setup{
    cmd = { omnisharp_bin, "--languageserver" , "--hostPID", tostring(pid) },
    on_attach = onAttach
}

