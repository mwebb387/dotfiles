local util = require 'lspconfig/util'

local onAttach = require'lsp/lsp-attach'
-- local lspHandlers = require'lsp/handlers'

vim.lsp.set_log_level("debug")

local pid = vim.fn.getpid()
local home = vim.fn.expand('~')
local omnisharp_bin = home .. [[\scoop\apps\omnisharp\current\OmniSharp.exe]]
require'lspconfig'.omnisharp.setup{
    cmd = { omnisharp_bin, "--languageserver" , "--hostPID", tostring(pid) },
    -- root_dir = util.root_pattern("*.sln"),
    on_attach = onAttach,
    -- handlers = lspHandlers,
}

