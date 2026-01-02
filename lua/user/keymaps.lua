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

--Next
vim.keymap.set("i", "<C-j>", "copilot#Next()", {expr=true, silent=true})
--Prev
vim.keymap.set("i", "<C-k>", "copilot#Previous()", {expr=true, silent=true})
--accept
vim.keymap.set("i", "<C-a>", "copilot#Accept()", {noremap = true, replace_keycodes = false, expr=true, silent=true})
--accept word
vim.keymap.set("i", "<C-w>", "copilot#AcceptWord()", {expr=true, silent=true,  replace_keycodes = false})
--accept line
vim.keymap.set("i", "<C-l>", "copilot#AcceptLine()", {expr=true, silent=true})
--Clear
vim.keymap.set("i", "<C-x>", "copilot#Clear()", {expr=true, silent=true})


--Open chat
vim.keymap.set("n", "<leader>cc", ":CopilotChatToggle<CR>", { silent = true })
vim.keymap.set("v", "<leader>cc", ":CopilotChatToggle<CR>", { silent = true })

-- Quickchat
local actions = require("CopilotChat.actions")
local telescope_integration = require("CopilotChat.integrations.telescope")


vim.keymap.set("v", "<leader>cp", function()
  telescope_integration.pick(actions.prompt_actions({
    selection = require("CopilotChat.select").visual,
  }))
end, { desc = "CopilotChat - Prompt actions" })


vim.keymap.set("n", "<leader>cp", function()
  telescope_integration.pick(actions.prompt_actions())
end, { desc = "CopilotChat - Prompt actions" })

vim.keymap.set("n", "<leader>cq", function()
  local input = vim.fn.input("Quick Chat: ")
  if input ~= "" then
    require("CopilotChat").ask(input, { selection = require("CopilotChat.select").buffer })
  end
end, { desc = "CopilotChat - Quick chat" })


vim.keymap.set("n", "<leader>pp", ":set filetype=html <CR> :set syntax=php<CR>", {})
vim.keymap.set("n", "<leader>e", "<CMD>Oil<CR>", { desc = "Open parent directory" })
