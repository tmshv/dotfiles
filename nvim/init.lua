require("tmshv.options")
require("tmshv.keymaps")

local plugins = require("tmshv.packer")
plugins(require("tmshv.plugins"))

require("tmshv.colors")
require("tmshv.lsp")
require("tmshv.autocomplete")
require("tmshv.telescope")
require("tmshv.tree")
require("tmshv.comment")
require("tmshv.treesitter")
require("tmshv.autopairs")
require("tmshv.indent")
require("tmshv.git")
require("tmshv.tabs")
require("tmshv.status")

