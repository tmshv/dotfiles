local status_ok, tree = pcall(require, "nvim-tree")
if not status_ok then
  return
end

local config_status_ok, nvim_tree_config = pcall(require, "nvim-tree.config")
if not config_status_ok then
    return
end

local tree_cb = nvim_tree_config.nvim_tree_callback

tree.setup({
--  sort_by = "case_sensitive",
    filters = {
        dotfiles = true,
    },
    disable_netrw = true,
    hijack_netrw = true,
    open_on_tab = false,
    hijack_cursor = false,
    update_cwd = true,
    hijack_directories = {
        enable = true,
        auto_open = true,
    },
    diagnostics = {
        enable = true,
        icons = {
            hint = "",
            info = "",
            warning = "",
            error = "",
        },
    },
    update_focused_file = {
        enable = true,
        update_cwd = true,
        ignore_list = {},
    },
    git = {
        enable = true,
        ignore = true,
        timeout = 50,
    },
    view = {
        hide_root_folder = false,
        side = "left",
        mappings = {
            custom_only = false,
            list = {
                { key = { "l", "<CR>", "o" }, cb = tree_cb "edit" },
                { key = "h", cb = tree_cb "close_node" },
                --[[ { key = "v", cb = tree_cb "vsplit" }, ]]
            },
        },
        number = false,
        relativenumber = false,
    },
    --[[ actions = { ]]
    --[[     quit_on_open = true, ]]
    --[[     window_picker = { enable = true }, ]]
    --[[ }, ]]
    renderer = {
        highlight_git = true,
        root_folder_modifier = ":t",
        icons = {
            show = {
                file = true,
                folder = true,
                folder_arrow = true,
                git = true,
            },
            glyphs = {
                default = "",
                symlink = "",
                git = {
                    unstaged = "",
                    staged = "S",
                    unmerged = "",
                    renamed = "➜",
                    deleted = "",
                    untracked = "U",
                    ignored = "◌",
                },
                folder = {
                    default = "",
                    open = "",
                    empty = "",
                    empty_open = "",
                    symlink = "",
                },
            }
        }
    }
})

-- add useful keymaps
-- if #lvim.builtin.nvimtree.setup.view.mappings.list == 0 then
-- lvim.builtin.nvimtree.setup.view.mappings.list = {
--    { key = { "l", "<CR>", "o" }, action = "edit", mode = "n" },
--    { key = "h", action = "close_node" },
--    { key = "v", action = "vsplit" },
--    { key = "C", action = "cd" },
--    { key = "gtf", action = "telescope_find_files", action_cb = telescope_find_files },
--    { key = "gtg", action = "telescope_live_grep", action_cb = telescope_live_grep },
--}
--end
