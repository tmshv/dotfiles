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
    -- Add a space b/w comment and the line
    padding = true,
    -- Whether the cursor should stay at its position
    sticky = true,
    -- Lines to be ignored while (un)comment
    ignore = nil,
    -- Do not create mappings here: it is defined at keymap file
    mappings = false,
    -- Function to call before (un)comment
    pre_hook = pre_hook,
    -- Function to call after (un)comment
    post_hook = nil,
}
