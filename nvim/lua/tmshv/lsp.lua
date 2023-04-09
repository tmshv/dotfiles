-- skip if lspconfig is not available
local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
    return
end

require("mason").setup()
require("mason-lspconfig").setup({
    ensure_installed = {
        "pyright",
        "rust_analyzer",
        "tsserver",
    },
})

local lsp = require("lsp-zero")
-- TODO: see how it can be replaced with more customized setup
lsp.preset("recommended")

lsp.skip_server_setup({
    "denols",
    "remark_ls",
    -- "eslint",
    -- "angularls",
})

-- how to configure a language server
lsp.configure("tsserver", {
    on_attach = function(client, bufnr)
        -- print('hello tsserver')
        -- TODO: disable resolved_capabilies.document_formatting = fasle
    end,
    -- settings = {
    --   completions = {
    --     completeFunctionCalls = true
    --   }
    -- }
})

lsp.configure("eslint", {
    -- fix an error of eslint (Cannot read properties of undefined (reading 'loc') indent rule
    -- while declaring new variable
    -- more info here:
    -- https://neovim.discourse.group/t/supressing-eslint-ls-errors/1687/5
    handlers = {
        ["window/showMessageRequest"] = function(_, result, params)
            return result
        end
    }
})

-- configure lua language server for neovim
lsp.nvim_workspace()

lsp.setup()
-- learn the keybindings: :help lsp-zero-keybindings
-- learn to configure LSP servers: :help lsp-zero-api-showcase

-- Reserve space for diagnostic icons (LSP):
vim.opt.signcolumn = "yes" -- always show the sign column, otherwise it would shift the text each time
