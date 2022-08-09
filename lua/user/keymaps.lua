-- Shorten function name
local keymap = vim.keymap.set
-- Silent keymap option
local opts = { silent = true }

--Remap space as leader key
-- keymap("", "<Space>", "<Nop>", opts)
-- vim.g.mapleader = " "

--Remap ; as leader key
keymap("", ";", "<Nop>", opts)
vim.g.mapleader = ";"

-- Insert --
-- Press jk to escape from insert mode to normal_mode
keymap("i", "jk", "<ESC>", opts)

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Normal --
-- Better window navigation
-- keymap("n", "<C-h>", "<C-w>h", opts)
-- keymap("n", "<C-j>", "<C-w>j", opts)
-- keymap("n", "<C-k>", "<C-w>k", opts)
-- keymap("n", "<C-l>", "<C-w>l", opts)

-- split window
-- keymap("n", "<C-w>_", "<C-w>s", opts) -- split horizontally
-- keymap("n", "<C-w>|", "<C-w>v", opts) -- split vertically

-- `control + arrow` keys to resiz window
-- Need to disable the MacOS native shortcuts 
keymap("n", "<C-Up>", ":resize -2<CR>", opts)
keymap("n", "<C-Down>", ":resize +2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Navigate buffers
keymap("n", "<S-l>", ":bnext<CR>", opts) -- shirt + l
keymap("n", "<S-h>", ":bprevious<CR>", opts) -- shirt + h

-- Close buffers
keymap("n", "<leader>bd", "<cmd>Bdelete!<CR>", opts)

-- Clear highlights
keymap("n", "<leader>h", "<cmd>nohlsearch<CR>", opts)

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

-- Plugins --

-- NvimTree
keymap("n", "<leader>e", ":NvimTreeToggle<CR>", opts)

-- Telescope
keymap("n", "<leader>ff", ":Telescope find_files<CR>", opts)
keymap("n", "<leader>fF", ":Telescope oldfiles<CR>", opts)
-- search
-- Searches for the string under your cursor in your current working directory
keymap("n", "<leader>sS", ":Telescope grep_string<CR>", opts)
-- Search for a string in your current working directory and get results live as you type (respecting .gitignore)
keymap("n", "<leader>ss", ":Telescope live_grep<CR>", opts)
keymap("n", "<leader>fp", ":Telescope projects<CR>", opts)
keymap("n", "<leader>fc", ":Telescope command_history<CR>", opts)
keymap("n", "<leader>fr", ":Telescope registers<CR>", opts)
keymap("n", "<leader>fh", ":Telescope help_tags<CR>", opts)
keymap("n", "<leader>fm", ":Telescope marks<CR>", opts)
-- buffers
keymap("n", "<leader>bb", ":Telescope buffers<CR>", opts)
keymap("n", "<leader>bs", ":Telescope current_buffer_fuzzy_find<CR>", opts)
keymap("n", "<leader>bt", ":Telescope current_buffer_tags<CR>", opts)
-- git
keymap("n", "<leader>gc", ":Telescope git_commits<CR>", opts)
keymap("n", "<leader>gd", ":Telescope git_bcommits<CR>", opts)
keymap("n", "<leader>gb", ":Telescope git_branches<CR>", opts)
keymap("n", "<leader>gs", ":Telescope git_status<CR>", opts)
-- Lists Function names, variables, from Treesitter!
-- keymap("n", "<leader>ft", ":Telescope treesitter<CR>", opts)

-- Git
keymap("n", "<leader>gg", "<cmd>lua _LAZYGIT_TOGGLE()<CR>", opts)

-- Comment
keymap("n", "<leader>/", "<cmd>lua require('Comment.api').toggle_current_linewise()<CR>", opts)
keymap("x", "<leader>/", '<ESC><CMD>lua require("Comment.api").toggle_linewise_op(vim.fn.visualmode())<CR>')

-- DAP
keymap("n", "<leader>db", "<cmd>lua require'dap'.toggle_breakpoint()<cr>", opts)
keymap("n", "<leader>dc", "<cmd>lua require'dap'.continue()<cr>", opts)
keymap("n", "<leader>di", "<cmd>lua require'dap'.step_into()<cr>", opts)
keymap("n", "<leader>do", "<cmd>lua require'dap'.step_over()<cr>", opts)
keymap("n", "<leader>dO", "<cmd>lua require'dap'.step_out()<cr>", opts)
keymap("n", "<leader>dr", "<cmd>lua require'dap'.repl.toggle()<cr>", opts)
keymap("n", "<leader>dl", "<cmd>lua require'dap'.run_last()<cr>", opts)
keymap("n", "<leader>du", "<cmd>lua require'dapui'.toggle()<cr>", opts)
keymap("n", "<leader>dt", "<cmd>lua require'dap'.terminate()<cr>", opts)
