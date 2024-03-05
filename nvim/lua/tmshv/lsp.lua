-- skip if lspconfig is not available
local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
	return
end

require("mason").setup()
require("mason-lspconfig").setup({
    ensure_installed = {
        "lua_ls",
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

-- Configure tsserver for nodejs driven project only
lsp.configure("tsserver", {
	on_attach = function(client, bufnr)
		-- print("hello tsserver")
		-- TODO: disable resolved_capabilies.document_formatting = fasle
	end,
	root_dir = nvim_lsp.util.root_pattern("package.json"),
	single_file_support = false,
	-- settings = {
	--   completions = {
	--     completeFunctionCalls = true
	--   }
	-- }
})

-- Configure denols for deno projects
lsp.configure("denols", {
	on_attach = function(client, bufnr)
		-- print("hello denols")
		-- TODO: disable resolved_capabilies.document_formatting = fasle
	end,
	root_dir = nvim_lsp.util.root_pattern("deno.json", "deno.jsonc"),
})

lsp.configure("eslint", {
	-- fix an error of eslint (Cannot read properties of undefined (reading 'loc') indent rule
	-- while declaring new variable
	-- more info here:
	-- https://neovim.discourse.group/t/supressing-eslint-ls-errors/1687/5
	handlers = {
		["window/showMessageRequest"] = function(_, result, params)
			return result
		end,
	},
})

-- configure lua language server for neovim
lsp.nvim_workspace()

lsp.setup()
-- learn the keybindings: :help lsp-zero-keybindings
-- learn to configure LSP servers: :help lsp-zero-api-showcase

-- Reserve space for diagnostic icons (LSP):
vim.opt.signcolumn = "yes" -- always show the sign column, otherwise it would shift the text each time
