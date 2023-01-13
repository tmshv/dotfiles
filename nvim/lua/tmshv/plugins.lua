-- see how to configure plugin:
-- https://github.com/wbthomason/packer.nvim

return function(use)
    -- CORE
    -- this is a part of neovim actually
    -- but they need to be set here anyway ¯\_(ツ)_/¯
    use "wbthomason/packer.nvim" -- have packer manage itself
    use "nvim-lua/popup.nvim" -- an implementation of the Popup API from vim in Neovim
    use "nvim-lua/plenary.nvim" -- useful lua functions used ny lots of plugins

    -- COLORS
    use ({ "lunarvim/darkplus.nvim" })
    use ({
        "rose-pine/neovim",
        as = "rose-pine",
    })

    -- SNIPPETS
    use "L3MON4D3/LuaSnip"             --snippet engine
    use "rafamadriz/friendly-snippets" -- a bunch of snippets to use

    -- AUTOCOMPLETE (nvim-cmp based)
    -- TODO: make it opt as posible
    use "hrsh7th/nvim-cmp"             -- completion plugin
    use "hrsh7th/cmp-buffer"           -- buffer completions source
    use "hrsh7th/cmp-path"             -- path completions source
    use "hrsh7th/cmp-cmdline"          -- cmdline completions source
    use "saadparwaiz1/cmp_luasnip"     -- snippet completions source
    use "hrsh7th/cmp-nvim-lua"         -- lua completions source
    use ({                             -- package.json copmletions source
        "David-Kunz/cmp-npm",
        requires = { "nvim-lua/plenary.nvim" }
    })

    -- LSP
    use "neovim/nvim-lspconfig"              -- enable LSP
    use "williamboman/mason.nvim"            -- UI for LSP servers
    use "williamboman/mason-lspconfig.nvim"
    use ({
        "hrsh7th/cmp-nvim-lsp",              -- LSP completions source
        requires = {
            { "hrsh7th/nvim-cmp" },
        }
    })
    use ({
        "VonHeikemen/lsp-zero.nvim",         -- LSP autoconfig
        requires = {
            -- LSP Support
            {'neovim/nvim-lspconfig'},
            {'williamboman/mason.nvim'},
            {'williamboman/mason-lspconfig.nvim'},

            -- Autocompletion
            {'hrsh7th/nvim-cmp'},
            {'hrsh7th/cmp-buffer'},
            {'hrsh7th/cmp-path'},
            {'saadparwaiz1/cmp_luasnip'},
            {'hrsh7th/cmp-nvim-lsp'},
            {'hrsh7th/cmp-nvim-lua'},

            -- Snippets
            {'L3MON4D3/LuaSnip'},
            {'rafamadriz/friendly-snippets'},
        }
    })

    -- TELESCOPE
    use ({
        "nvim-telescope/telescope.nvim",
        requires = { {"nvim-lua/plenary.nvim"} }
    })
    -- use 'nvim-telescope/telescope-media-files.nvim'
end

