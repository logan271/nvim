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

-- Press jk to escape from insert mode to normal_mode
keymap("i", "jk", "<ESC><right>", opts)

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
-- keymap("n", "<leader>h", "<cmd>nohlsearch<CR>", opts)

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

-- Hop
keymap("n", "<leader>jw", ":HopWord<cr>", opts)
keymap("n", "<leader>jc", ":HopChar1<cr>", opts)
keymap("n", "<leader>jl", ":HopLine<cr>", opts)

-- trouble
keymap("n", "<leader>xx", ":TroubleToggle<cr>", opts)
keymap("n", "<leader>xw", ":TroubleToggle workspace_diagnostics<cr>", opts)
keymap("n", "<leader>xd", ":TroubleToggle document_diagnostics<cr>", opts)
keymap("n", "<leader>xq", ":TroubleToggle quickfix<cr>", opts)
keymap("n", "<leader>xl", ":TroubleToggle loclist<cr>", opts)
keymap("n", "gR", ":TroubleToggle lsp_references<cr>", opts)

-- Symboloutline
keymap("n", "gs", ":SymbolsOutline<cr>", opts)

-- neogen
keymap("n", "g/", ":Neogen<CR>", opts)
