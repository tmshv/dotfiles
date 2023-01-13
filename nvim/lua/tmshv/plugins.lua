-- see how to configure plugin:
-- https://github.com/wbthomason/packer.nvim

return function(use)
    -- THEMES
    use ({ "lunarvim/darkplus.nvim" })
    use ({
        "rose-pine/neovim",
        as = "rose-pine",
    })
end

