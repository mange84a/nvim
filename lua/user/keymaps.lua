local opts = { noremap = true, silent = true }

local term_opts = { silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

--Remap space as leader key
keymap("", " ", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Normal --
keymap("n", "<leader>e", ":Vexplore<cr>", opts)

-- Resize with arrows
keymap("n", "<C-Up>", ":resize -2<CR>", opts)
keymap("n", "<C-Down>", ":resize +2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize +2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize -2<CR>", opts)


-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Move text up and down
keymap("n", "<A-j>", ":m .+1<CR>==", opts)
keymap("n", "<A-k>", ":m .-2<CR>==", opts)

keymap("v", "<A-j>", ":m .+1<CR>==", opts)
keymap("v", "<A-k>", ":m .-2<CR>==", opts)
keymap("v", "p", '"_dP', opts)

-- Visual Block --
-- Move text up and down
keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
keymap("x", "K", ":move '<-2<CR>gv-gv", opts)
keymap("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
keymap("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)


local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fw', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})

vim.keymap.set("n", "<S-l>", "<cmd>bnext<cr>", {})
vim.keymap.set("n", "<S-h>", "<cmd>bprevious<cr>", {})
vim.keymap.set("n", "<S-q>", ":b#|bd#<CR>", {})

-- Bind neocodeium
-- clear
vim.keymap.set("i", "<C-c>", function()
    require("neocodeium").clear()
end)

-- accept
vim.keymap.set("i", "<C-a>", function()
    require("neocodeium").accept()
end)

-- accept word
vim.keymap.set("i", "<C-w>", function()
    require("neocodeium").accept_word()
end)

-- accept line
vim.keymap.set("i", "<C-l>", function()
    require("neocodeium").accept_line()
end)

-- Open chat
vim.keymap.set("n", "<leader>cc", ":NeoCodeium chat<CR>", {})

vim.keymap.set("n", "<leader>pp", ":set filetype=html <CR> :set syntax=php<CR>", {})
