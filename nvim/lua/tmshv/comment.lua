local status_ok, comment = pcall(require, "Comment")
if not status_ok then
    return
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
    -- setup context for JSX commenting
    pre_hook = function(ctx)
        local U = require "Comment.utils"

        local location = nil
        if ctx.ctype == U.ctype.block then
            location = require("ts_context_commentstring.utils").get_cursor_location()
        elseif ctx.cmotion == U.cmotion.v or ctx.cmotion == U.cmotion.V then
            location = require("ts_context_commentstring.utils").get_visual_start_location()
        end

        return
        --[[ return require("ts_context_commentstring.internal").calculate_commentstring { ]]
        --[[     key = ctx.ctype == U.ctype.line and "__default" or "__multiline", ]]
        --[[     location = location, ]]
        --[[ } ]]
    end,
    post_hook = nil,
}
