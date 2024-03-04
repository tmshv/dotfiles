local status_ok, null_ls = pcall(require, "null-ls")
if not status_ok then
	vim.notify("null-ls not found. Check your config")
	return
end

null_ls.setup({
    autostart = true,
	sources = {
		-- An opinionated code formatter for Lua.
		null_ls.builtins.formatting.stylua,

		-- The Refactoring library based off the Refactoring book by Martin Fowler.
		-- null_ls.builtins.code_actions.refactoring,

		-- Actionlint is a static checker for GitHub Actions workflow files.
		null_ls.builtins.diagnostics.actionlint,

		-- commitlint checks if your commit messages meet the conventional commit format.
		-- null_ls.builtins.diagnostics.commitlint,

		-- Lightning-fast linter for .env files.
		null_ls.builtins.diagnostics.dotenv_linter,

		-- Markdown style and syntax checker.
		null_ls.builtins.diagnostics.markdownlint,

		-- Tidy corrects and cleans up HTML and XML documents by fixing markup errors and upgrading legacy code to modern standards.
		null_ls.builtins.diagnostics.tidy,

		-- Uses inbuilt Lua code and treesitter to detect lines with TODO comments and show a diagnostic warning on each line where it's present.
		null_ls.builtins.diagnostics.todo_comments,

		-- Uses zsh's own -n option to evaluate, but not execute, zsh scripts.
		-- Effectively, this acts somewhat like a linter, although it only really checks for serious errors - and will likely only show the first error.
		null_ls.builtins.diagnostics.zsh,

		-- Formatter, linter, bundler, and more for JavaScript, TypeScript, JSON, HTML, Markdown, and CSS.
		null_ls.builtins.formatting.biome,

		-- Fix common misspellings in text files.
		-- null_ls.builtins.formatting.codespell,

		-- Formats go programs.
		-- null_ls.builtins.formatting.gofmt,

		-- Updates your Go import lines, adding missing ones and removing unreferenced ones.
		-- null_ls.builtins.formatting.goimports,

		-- impl generates method stubs for implementing an interface.
		-- null_ls.builtins.code_actions.impl,

		-- PostgreSQL SQL syntax beautifier
		null_ls.builtins.formatting.pg_format,

		-- The sqlformat command-line tool can reformat SQL files according to specified options.
		null_ls.builtins.formatting.sqlformat,

		-- Prettier is an opinionated code formatter.
		-- It enforces a consistent style by parsing your code and re-printing it with its own rules that take the maximum line length into account, wrapping code when necessary.
		-- null_ls.builtins.formatting.prettier,

		-- CLI for organizing Tailwind CSS classes.
		-- null_ls.builtins.formatting.rustywind,

		-- Hardens shell scripts by quoting variables, replacing function_call with $(function_call), and more.
		null_ls.builtins.formatting.shellharden,

		-- A shell parser, formatter, and interpreter with bash support.
		null_ls.builtins.formatting.shfmt,

		-- make linter.
		null_ls.builtins.diagnostics.checkmake,

		-- Format your Justfile
		null_ls.builtins.formatting.just,
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
