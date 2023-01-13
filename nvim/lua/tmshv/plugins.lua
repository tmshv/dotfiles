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

    -- AUTOCOMPLETE (nvim-cmp based)
    -- TODO: make it opt as posible
    use "hrsh7th/nvim-cmp"             -- The completion plugin
    use "hrsh7th/cmp-buffer"           -- buffer completions
    use "hrsh7th/cmp-path"             -- path completions
    use "hrsh7th/cmp-cmdline"          -- cmdline completions
    use "saadparwaiz1/cmp_luasnip"     -- snippet completions

    -- SNIPPETS
    use "L3MON4D3/LuaSnip"             --snippet engine
    use "rafamadriz/friendly-snippets" -- a bunch of snippets to use
end

