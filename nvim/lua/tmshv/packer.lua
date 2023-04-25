-- ALL CODE BELOW IS RELATED TO PACKER

local fn = vim.fn

-- automatically install packer
-- this part of code is taken from https://github.com/wbthomason/packer.nvim
-- BUT CHANGED A BIT TO LOOKS BETTER
local ensure_packer = function()
    local fn = vim.fn
    local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
    if fn.empty(fn.glob(install_path)) > 0 then
        fn.system {
            "git",
            "clone",
            "--depth",
            "1",
            "https://github.com/wbthomason/packer.nvim",
            install_path,
        }
        print("Installing packer close and reopen Neovim...")
        vim.cmd [[packadd packer.nvim]]
        return true
    end
    return false
end
local PACKER_BOOTSTRAP = ensure_packer()

-- autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

-- use a protected call so we don't error out on first use
-- !!!
-- code below wont work if packer failed
-- !!!
local status_ok, packer = pcall(require, "packer")
if not status_ok then
    return
end

-- have packer use a popup window
packer.init {
    display = {
        open_fn = function()
            return require("packer.util").float { border = "rounded" }
        end,
    },
}

-- Install your plugins here
return function(plugins)
    return packer.startup(function(use)
        plugins(use)

        -- automatically set up your configuration after cloning packer.nvim
        -- keep this at the end after all plugins
        if PACKER_BOOTSTRAP then
            packer.sync()
        end
    end)
end
