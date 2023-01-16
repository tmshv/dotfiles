local status_ok, configs = pcall(require, "nvim-treesitter.configs")
if not status_ok then
  return
end

configs.setup({
    -- ensure_installed = "maintained",
    ensure_installed = {
        "c",
        "cpp",
        "css",
        "comment",
        "dockerfile",
        "lua",
        "vim",
        "help",
        "bash",
        "gitignore",
        "go",
        "graphql",
        "haskell",
        "html",
        "http",
        "java",
        "javascript",
        "jq",
        "json",
        "json5",
        "kotlin",
        "latex",
        "markdown",
        "org",
        "prisma",
        "python",
        "regex",
        "rust",
        "sql",
        "svelte",
        "swift",
        "terraform",
        "toml",
        "tsx",
        "typescript",
        "yaml",
    },
    sync_install = false,

    -- automatically install missing parsers when entering buffer
    -- recommendation: set to false if you don't have `tree-sitter` CLI installed locally
    auto_install = true,
    -- ingnore_install = {}
    highlight = {
        enable = true,
        -- disable = {}, -- disable highlight in this langualges
        additional_vim_regex_highlighting = true,
    },
    -- automatically indent on press O and in other cases
    indent = {
        enable = true,
        disable = { "yaml" },
    },
    incremental_selection = {
        enable = true,
        keymaps = {
            init_selection = "gnn", -- set to `false` to disable one of the mappings
            node_incremental = "grn",
            scope_incremental = "grc",
            node_decremental = "grm",
        },
    },
    autopairs = {
        enable = true,
    },
    context_commentstring = {
        enable = true,
        enable_autocmd = false,
    },
    rainbow = {
        enable = true,
        extended_mode = true,
        max_file_lines = nil,
    },
})

