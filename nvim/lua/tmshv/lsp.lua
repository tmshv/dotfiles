-- skip if lspconfig is not available 
local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
    return
end

require("mason").setup()
require("mason-lspconfig").setup()

local lsp = require('lsp-zero')
lsp.preset('recommended')
lsp.setup()
-- Learn the keybindings, see :help lsp-zero-keybindings
-- Learn to configure LSP servers, see :help lsp-zero-api-showcase

-- Reserve space for diagnostic icons (LSP):
vim.opt.signcolumn = "yes"                      -- always show the sign column, otherwise it would shift the text each time

