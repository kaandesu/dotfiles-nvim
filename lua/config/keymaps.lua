-- Default keymaps: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua

local discipline = require("kaandesu.discipline")
discipline.cowboy()

local keymap = vim.keymap
local opts = { noremap = true, silent = true }

-- Increment / Decrement

keymap.set("n", "+", "<C-a>")
keymap.set("n", "-", "<C-x>")

-- Delete a word backward
keymap.set("n", "dW", "dB")

-- mini.surround
-- keymap.set("n", "<C-g>", "gs")

-- Select All
keymap.set("n", "<C-A>", "ggVG")

-- Jumplist
keymap.set("n", "<C-m>", "<C-i>", opts)

-- Page Up / down
keymap.set("n", "<C-d>", "<C-d>zz")
keymap.set("n", "<C-u>", "<C-u>zz")

-- New Tab
keymap.set("n", "te", ":tabedit<Return>")
keymap.set("n", "<tab>", ":tabnext<Return>", opts)
keymap.set("n", "<s-tab>", ":tabprev<Return>", opts)
keymap.set("n", "td", ":tabclose<Return>", opts)

-- Split Window
keymap.set("n", "ss", ":split<Return>", opts)
keymap.set("n", "sv", ":vsplit<Return>", opts)

-- Move Window (using: "christoomey/vim-tmux-navigator")
keymap.set("n", "<C-j>", ":TmuxNavigateDown<CR>", { silent = true })
keymap.set("n", "<C-k>", ":TmuxNavigateUp<CR>", { silent = true })
keymap.set("n", "<C-h>", ":TmuxNavigateLeft<CR>", { silent = true })
keymap.set("n", "<C-l>", ":TmuxNavigateRight<CR>", { silent = true })

-- Resize Window
keymap.set("n", "<C-w><left>", "<C-w><")
keymap.set("n", "<C-w><right>", "<C-w>>")
keymap.set("n", "<C-w><up>", "<C-w>+")
keymap.set("n", "<C-w><down>", "<C-w>-")

-- Oil.nvim keymaps
require("oil").setup({})
keymap.set("n", "<C-e>", "<CMD>Oil --float<CR>", { desc = "Open parent directory" })

-- nvim.bqf  (quickfix list)
keymap.set("n", "<C-c>", "<CMD>copen<CR>", { desc = "Open quickfix list" })
keymap.set("n", "<C-q>", "<CMD>cclose<CR>", { desc = "Open quickfix list" })

-- Diagnostics
keymap.set("n", "<C-J>", function()
  vim.diagnostic.goto_next()
end, opts)

keymap.set("n", "<leader>r", function()
  require("kaandesu.utils").replaceHexWithHSL()
end)
