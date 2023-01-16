local status_ok, configs = pcall(require, "nvim-treesitter.configs")
if not status_ok then
  return
end

configs.setup({
    ensure_installed = "maintained",
    sync_install = false,
    -- ingnore_install = {}
    highlight = {
        enable = true,
        -- disable = {}, -- disable highlight in this langualges
        additional_vim_regex_highlighting = true,
    },
    indent = {
        enable = true,
        disable = { "yaml" },
    },
})

