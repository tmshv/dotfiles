local status_ok, comment = pcall(require, "Comment")
if not status_ok then
    return
end

-- setup context for JSX commenting
local pre_hook = nil
local status_ok_tscc, ts_context_commentstring = pcall(require, "ts_context_commentstring.integrations.comment_nvim")
if status_ok_tscc then
    pre_hook = ts_context_commentstring.create_pre_hook()
end

comment.setup {
    ---Add a space b/w comment and the line
    padding = true,
    ---Whether the cursor should stay at its position
    sticky = true,
    ---Lines to be ignored while (un)comment
    ignore = nil,
    ---LHS of toggle mappings in NORMAL mode
    toggler = {
        ---Line-comment toggle keymap
        line = "<leader>/",
        ---Block-comment toggle keymap
        -- block = "<leader>c/",
    },
    ---LHS of operator-pending mappings in NORMAL and VISUAL mode
    opleader = {
        line = "<leader>/",
        -- block = "<leader>c",
    },
    ---LHS of extra mappings
    -- extra = {
    --     above = 'gcO',
    --     below = 'gco',
    --     eol = 'gcA',
    -- },
    ---Enable keybindings
    ---NOTE: If given `false` then the plugin won't create any mappings
    mappings = {
        ---Operator-pending mapping; `gcc` `gbc` `gc[count]{motion}` `gb[count]{motion}`
        basic = true,
        ---Extra mapping; `gco`, `gcO`, `gcA`
        extra = false,
    },
     ---Function to call before (un)comment
    pre_hook = pre_hook,
    ---Function to call after (un)comment
    post_hook = nil,
}
