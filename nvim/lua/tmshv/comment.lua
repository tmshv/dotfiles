local status_ok, comment = pcall(require, "Comment")
if not status_ok then
    return
end

-- Set vim.g.skip_ts_context_commentstring_module = true somewhere in your configuration
-- to skip backwards compatibility routines and speed up loading.
-- as described here https://github.com/JoosepAlviste/nvim-ts-context-commentstring
vim.g.skip_ts_context_commentstring_module = true

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
    pre_hook = function()
        return vim.bo.commentstring
    end,
    -- Function to call after (un)comment
    post_hook = nil,
}
