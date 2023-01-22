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
        null_ls.builtins.diagnostics.eslint,

        -- python
        null_ls.builtins.formatting.black,
        -- null_ls.builtins.formatting.isort,
        -- null_ls.builtins.diagnostics.flake8,

        --[[ null_ls.builtins.completion.spell, ]]
    },
})
