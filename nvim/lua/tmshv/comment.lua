local status_ok, comment = pcall(require, "Comment")
if not status_ok then
    return
end

-- setup context for JSX commenting
local pre_hook = nil
local status_ok, ts_context_commentstring = pcall(require, "ts_context_commentstring.integrations.comment_nvim")
if status_ok then
    pre_hook = ts_context_commentstring.create_pre_hook()
end

comment.setup {
    padding = true,
    sticky = true,
    ignore = nil,
    toggler = {
        ---Line-comment toggle keymap
        line = "<leader>/",
        ---Block-comment toggle keymap
        -- block = "<leader>c/",
    },
    opleader = {
        line = "<leader>/",
        -- block = "<leader>c",
    },
    extra = {
        above = 'gcO',
        below = 'gco',
        eol = 'gcA',
    },
    mappings = {
        basic = true,
        extra = false,
    },
    pre_hook = pre_hook,
    post_hook = nil,
}
