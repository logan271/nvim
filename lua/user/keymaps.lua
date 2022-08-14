-- Shorten function name
local keymap = vim.keymap.set
-- Silent keymap option
local opts = { silent = true, noremap = true }

--Remap space as leader key
-- keymap("", "<Space>", "<Nop>", opts)
-- vim.g.mapleader = " "

--Remap ; as leader key
keymap("", ";", "<Nop>", opts)
vim.g.mapleader = ";"

-- Press jk to escape from insert mode to normal_mode
keymap("i", "jk", "<ESC>", opts)

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Windows
keymap("n", "<C-w>_", "<C-w>s", opts) -- split horizontally
keymap("n", "<C-w>|", "<C-w>v", opts) -- split vertically

-- `control + arrow` keys to resiz window
-- Need to disable the MacOS native shortcuts
keymap("n", "<C-Up>", ":resize -2<CR>", opts)
keymap("n", "<C-Down>", ":resize +2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Buffers
keymap("n", "<S-l>", ":bnext<CR>", opts) -- shirt + l
keymap("n", "<S-h>", ":bprevious<CR>", opts) -- shirt + h
-- Close buffers
keymap("n", "<leader>bd", "<cmd>Bdelete!<CR>", opts)

-- Clear highlights
keymap("n", "<Space>h", "<cmd>nohlsearch<CR>", opts)

-- quit vim
keymap("n", "<S-q>", "<cmd>quit!<CR>", opts)

-- Better paste
keymap("v", "p", '"_dP', opts)

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Visual Block --
-- Move text up and down
keymap("x", "<C-j>", ":move '>+1<CR>gv-gv", opts)
keymap("x", "<C-k>", ":move '<-2<CR>gv-gv", opts)

