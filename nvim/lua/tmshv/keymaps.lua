local opts = { noremap = true, silent = true }
local term_opts = { silent = true }

-- functions for setting up shortcuts
local keymap = vim.api.nvim_set_keymap

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
keymap("n", "<leader>e", "<cmd>NvimTreeToggle<CR>", opts)
-- keymap("n", "<leader>e", ":Lex 30<cr>", opts) -- can be used as fallback

-- save
keymap("n", "<C-s>", "<cmd> w <CR>", opts) -- save file

-- toggle relative number
keymap("n", "<leader>nn", "<cmd> set rnu! <CR>", opts)

-- new buffer
keymap("n", "<leader>b", "<cmd> enew <CR>", opts) -- new buffer

-- LSP keymaps
keymap("n", "<leader>lf", "<cmd>lua vim.lsp.buf.format()<CR>", opts)
keymap("n", "<leader>lr", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)

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

