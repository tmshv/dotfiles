local opts = { noremap = true, silent = true }
local term_opts = { silent = true }

-- functions for setting up shortcuts
-- local keymap = vim.api.nvim_set_keymap
local function keymap(mode, lhs, rhs, opts)
    local options = { noremap = true, silent = true }
    if opts then
        options = vim.tbl_extend("force", options, opts)
    end
    vim.keymap.set(mode, lhs, rhs, options)
end

-- set leader key: "Space" | " "
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Modes:
-- normal_mode = "n",
-- insert_mode = "i",
-- visual_mode = "v",
-- visual_block_mode = "x",
-- term_mode = "t",
-- command_mode = "c",

-- NORMAL --

keymap("n", "<ESC>", "<cmd> noh <CR>", opts) -- no highlight on Escape

-- navigate between tiles (windows) with Ctrl+hkjl
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- resize with arrows
-- keymap("n", "<C-Up>", ":resize +2<CR>", opts)
-- keymap("n", "<C-Down>", ":resize -2<CR>", opts)
-- keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
-- keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- navigate buffers with Shift+lh
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)

-- toggle file tree on leader+e
keymap("n", "<leader>e", "<cmd>NvimTreeToggle<CR>", { desc = "Toggle File Explorer" })

-- save
keymap("n", "<C-s>", "<cmd> w <CR>", { desc = "Save file" }) -- save file

-- toggle relative number
keymap("n", "<leader>nn", "<cmd> set rnu! <CR>", opts)

-- new buffer
keymap("n", "<leader>b", "<cmd> enew <CR>", { desc = "New buffer" }) -- new buffer

-- LSP keymaps
keymap("n", "<leader>la", "<cmd>lua vim.lsp.buf.code_action()<CR>", { desc = "Code Actions" })
keymap("n", "<leader>lf", "<cmd>lua vim.lsp.buf.format()<CR>", { desc = "Format" })
keymap("n", "<leader>lr", "<cmd>lua vim.lsp.buf.rename()<CR>", { desc = "Rename" })
keymap("n", "<leader>ld", "<cmd>lua vim.diagnostic.open_float()<CR>", { desc = "Diagnostics" })
-- telescope
keymap("n", "<leader>ff", "<cmd>Telescope find_files <CR>", { desc = "Files" })                           -- find files within current working directory, respects .gitignore
keymap("n", "<leader>fF", "<cmd>Telescope find_files hidden=true <CR>", { desc = "Files (with hidden)" }) -- find files within current working directory, respects .gitignore
keymap("n", "<leader>fg", "<cmd>Telescope live_grep <CR>", { desc = "Grep" })                             -- find string in current working directory as you type
keymap("n", "<leader>fg", "<cmd>Telescope git_files<cr>", { desc = "Git files" })                         -- Fuzzy search through the output of git ls-files command, respects .gitignore
keymap("n", "<leader>fc", "<cmd>Telescope grep_string<cr>")                                               -- find string under cursor in current working directory
keymap("n", "<leader>fb", "<cmd>Telescope buffers<cr>", { desc = "Buffers" })                             -- list open buffers in current neovim instance
keymap("n", "<leader>fh", "<cmd>Telescope help_tags<cr>", { desc = "Help tags" })                         -- list available help tags

-- copy all
-- ["<C-c>"] = { "<cmd> %y+ <CR>", "copy whole file" },

-- INSERT --

-- fast jk to exit insert mode
-- keymap("i", "jk", "<ESC>", opts)

-- go to beginning and end
-- keymap("i", "<C-b>", "<ESC>^i", opts) -- beginning of line
-- keymap("i", "<C-e>", "<End>^i", opts) -- end of line


-- Visual --

-- indent
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- move lines up and down with Option
keymap("v", "<A-j>", ":m .+1<CR>==", opts)
keymap("v", "<A-k>", ":m .-2<CR>==", opts)

-- smart replace yanked word
keymap("v", "p", '"_dP', opts)


-- VISUAL BLOCK --

-- move text up and down
-- keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
-- keymap("x", "K", ":move '<-2<CR>gv-gv", opts)
-- keymap("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
-- keymap("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)

-- TERMINAL --
-- terminal navigation
-- keymap("t", "<C-h>", "<C-\\><C-N><C-w>h", term_opts)
-- keymap("t", "<C-j>", "<C-\\><C-N><C-w>j", term_opts)
-- keymap("t", "<C-k>", "<C-\\><C-N><C-w>k", term_opts)
-- keymap("t", "<C-l>", "<C-\\><C-N><C-w>l", term_opts)

---------------------
-- General Keymaps
---------------------

keymap("n", "x", '"_x')  -- delete single character without copying into register
-- keymap.set("n", "d", '"_d') -- delete without copying into register
keymap("v", "p", '"_dP') -- paste without copying deleted value into register

-- window management
keymap("n", "<leader>wv", "<C-w>v", { desc = "Split vertically" })             -- split window vertically
keymap("n", "<leader>wh", "<C-w>s", { desc = "Split horizontally" })           -- split window horizontally
keymap("n", "<leader>we", "<C-w>=", { desc = "Split equal width and height" }) -- make split windows equal width & height
keymap("n", "<leader>wx", ":close<CR>", { desc = "Close window" })             -- close current split window

keymap("n", "<leader>to", ":tabnew<CR>", { desc = "New tab" })                 -- open new tab
keymap("n", "<leader>tx", ":tabclose<CR>", { desc = "Close tab" })             -- close current tab
keymap("n", "<leader>tn", ":tabn<CR>", { desc = "Go to next tab" })            --  go to next tab
keymap("n", "<leader>tp", ":tabp<CR>", { desc = "Go to prev tab" })            --  go to previous tab

keymap("n", "H", ":bprevious<CR>")                                             -- go to prev buffer
keymap("n", "L", ":bnext<CR>")                                                 -- go to next buffer

-- center cursor on the next page
keymap("n", "<C-u>", "<C-u>zz")
keymap("n", "<C-d>", "<C-d>zz")
