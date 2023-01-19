-- ENSURE RELATED PACKAGES ARE AVAILABLE:
local cmp_status_ok, cmp = pcall(require, "cmp")
if not cmp_status_ok then
    return
end
local snip_status_ok, luasnip = pcall(require, "luasnip")
if not snip_status_ok then
    return
end

require("luasnip/loaders/from_vscode").lazy_load()

-- TODO: check out what this function do
local check_backspace = function()
    local col = vim.fn.col "." - 1
    return col == 0 or vim.fn.getline("."):sub(col, col):match "%s"
end

--   פּ ﯟ   some other good icons
local kind_icons = {
    Text = "",
    Method = "m",
    Function = "",
    Constructor = "",
    Field = "",
    Variable = "",
    Class = "",
    Interface = "",
    Module = "",
    Property = "",
    Unit = "",
    Value = "",
    Enum = "",
    Keyword = "",
    Snippet = "",
    Color = "",
    File = "",
    Reference = "",
    Folder = "",
    EnumMember = "",
    Constant = "",
    Struct = "",
    Event = "",
    Operator = "",
    TypeParameter = "",
}
-- find more here: https://www.nerdfonts.com/cheat-sheet

local completion_source = {
    luasnip = "[Snippet]",
    buffer = "[Buffer]",
    path = "[Path]",
}

-- more info about how to configure this:
-- https://github.com/hrsh7th/nvim-cmp/wiki/Advanced-techniques
cmp.setup {
    -- setup snippet engine
    snippet = {
        expand = function(args)
            luasnip.lsp_expand(args.body) -- For `luasnip` users.
        end,
    },

    -- sources to nvim-cmp are here
    -- order of the list make sense
    sources = {
        { name = "luasnip" },
        { name = "buffer" },
        { name = "path" },
        { name = 'npm', keyword_length = 4 }, -- TODO: be sure it is works
    },

    -- setup nvim-cmp keymaps
    mapping = {
        -- show completion window on Ctrl+Space
        ["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),

        -- navigate Ctrl+jk in completion window
        ["<C-k>"] = cmp.mapping.select_prev_item(),
        ["<C-j>"] = cmp.mapping.select_next_item(),

        -- scroll with Ctrl+bf in documentation window
        ["<C-b>"] = cmp.mapping(cmp.mapping.scroll_docs(-1), { "i", "c" }),
        ["<C-f>"] = cmp.mapping(cmp.mapping.scroll_docs(1), { "i", "c" }),

        -- TODO: dont sure I need it
        ["<C-y>"] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.

        -- cancel completion with Ctrl+e
        -- TODO: dont sure I need it
        ["<C-e>"] = cmp.mapping {
            i = cmp.mapping.abort(),
            c = cmp.mapping.close(),
        },

        -- Accept currently selected item. If none selected, `select` first item.
        -- Set `select` to `false` to only confirm explicitly selected items.
        ["<CR>"] = cmp.mapping.confirm { select = true },

        -- smart behavior on Tab button
        -- TODO: dont sure I need it
        ["<Tab>"] = cmp.mapping(function(fallback)
            -- select next completion item if completion window is open
            if cmp.visible() then
                cmp.select_next_item()
                -- some sort of snippet window action
            elseif luasnip.expandable() then
                luasnip.expand()
                -- and one more snippet window action
            elseif luasnip.expand_or_jumpable() then
                luasnip.expand_or_jump()
                -- TODO: dont know what is this
            elseif check_backspace() then
                fallback()
            else
                fallback()
            end
        end, {
            "i",
            "s",
        }),
        -- a bit less smarter behavior on Shift+Tab button
        ["<S-Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
                luasnip.jump(-1)
            else
                fallback()
            end
        end, {
            "i",
            "s",
        }),
    },

    -- how completion window looks
    formatting = {
        -- direction of menu item: [Icon] Keyword [Type]
        fields = { "kind", "abbr", "menu" },
        format = function(entry, vim_item)
            -- Kind icons
            vim_item.kind = string.format("%s", kind_icons[vim_item.kind])
            vim_item.menu = completion_source[entry.source.name]
            return vim_item
        end,
    },

    confirm_opts = {
        behavior = cmp.ConfirmBehavior.Replace,
        select = false,
    },
    window = {
        documentation = cmp.config.window.bordered(),
    },
    experimental = {
        -- write ghost_text to show how your input will look like
        ghost_text = true,
        -- TODO: dont sure i need it
        native_menu = false,
    },
}
