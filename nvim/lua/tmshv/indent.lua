local status_ok, indent = pcall(require, "indent_blankline")
if not status_ok then
  return
end

-- show EOL character
vim.opt.list = true
-- vim.opt.listchars:append "eol:↴"

indent.setup {
    -- for example, context is off by default, use this to turn it on
    show_current_context = true,
    show_current_context_start = true,
    show_end_of_line = true, -- show EOL character
}

