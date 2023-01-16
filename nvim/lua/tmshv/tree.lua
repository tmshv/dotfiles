local status_ok, tree = pcall(require, "nvim-tree")
if not status_ok then
  return
end

-- OR setup with some options
tree.setup({
--  sort_by = "case_sensitive",
    view = {
--    adaptive_size = true,
--    mappings = {
--      list = {
--        { key = "u", action = "dir_up" },
--      },
--    },
    },
--  renderer = {
--    group_empty = true,
--  },
--  filters = {
--    dotfiles = true,
--  },
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
