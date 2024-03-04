local status_ok, null_ls = pcall(require, "null-ls")
if not status_ok then
	vim.notify("null-ls not found. Check your config")
	return
end

null_ls.setup({
	sources = {
		-- lua
		-- null_ls.builtins.formatting.stylua,

		-- js/ts
		-- null_ls.builtins.diagnostics.eslint,

		-- python
		-- null_ls.builtins.formatting.black,
		-- null_ls.builtins.formatting.isort,
		-- null_ls.builtins.diagnostics.flake8,

		-- null_ls.builtins.completion.spell,
	},
})

-- Example of adding custom LSP Source
local no_really = {
	method = null_ls.methods.DIAGNOSTICS,
	filetypes = { "markdown", "text" },
	generator = {
		fn = function(params)
			local diagnostics = {}
			-- sources have access to a params object
			-- containing info about the current file and editor state
			for i, line in ipairs(params.content) do
				local col, end_col = line:find("really")
				if col and end_col then
					-- null-ls fills in undefined positions
					-- and converts source diagnostics into the required format
					table.insert(diagnostics, {
						row = i,
						col = col,
						end_col = end_col + 1,
						source = "no-really",
						message = "Don't use 'really!'",
						severity = vim.diagnostic.severity.WARN,
					})
				end
			end
			return diagnostics
		end,
	},
}
null_ls.register(no_really)
