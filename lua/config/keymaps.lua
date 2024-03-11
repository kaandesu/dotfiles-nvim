-- Default keymaps: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua

local discipline = require("kaandesu.discipline")
discipline.init()

local harpoon = require("harpoon")
harpoon:setup({})

--- Vim-apm setup
local apm = require("vim-apm")
apm:setup({})
--- Toggle apm on init
apm:toggle_monitor()
vim.keymap.set("n", "<leader>apm", function()
  apm:toggle_monitor()
end)

local keymap = vim.keymap
local opts = { noremap = true, silent = true }

-- Extra langmap for Turkish characters
-- vim.api.nvim_set_option("langmap", "ü{,ğ}")

-- Enter edit mode on lazier v
vim.keymap.set("v", ":", ":s/")

vim.keymap.set("n", "ğ", "}zz")
vim.keymap.set("n", "ü", "{zz")
vim.keymap.set("v", "ğ", "}zz")
vim.keymap.set("v", "ü", "{zz")

-- Harpoon keymaps
vim.keymap.set("n", "<leader>a", function()
  harpoon:list():append()
end, { desc = "Harpoon append" })
vim.keymap.set("n", "<C-q>", function()
  harpoon.ui:toggle_quick_menu(harpoon:list())
end)

vim.keymap.set("n", "<leader>1", function()
  harpoon:list():select(1)
end, { desc = "Harpoon select 1" })
vim.keymap.set("n", "<leader>2", function()
  harpoon:list():select(2)
end, { desc = "Harpoon select 2" })
vim.keymap.set("n", "<leader>3", function()
  harpoon:list():select(3)
end, { desc = "Harpoon select 3" })
vim.keymap.set("n", "<leader>4", function()
  harpoon:list():select(4)
end, { desc = "Harpoon select 4" })

-- Toggle previous & next buffers stored within Harpoon list
vim.keymap.set("n", "<C-p>", function()
  harpoon:list():prev()
end)
vim.keymap.set("n", "<C-n>", function()
  harpoon:list():next()
end)

-- Increment / Decrement

keymap.set("n", "+", "<C-a>")
keymap.set("n", "-", "<C-x>")

-- Delete a word backward
keymap.set("n", "dW", "db")

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
keymap.set("n", "<C-w><left>", "<C-w>7<")
keymap.set("n", "<C-w><right>", "<C-w>7>")
keymap.set("n", "<C-w><up>", "<C-w>7+")
keymap.set("n", "<C-w><down>", "<C-w>7-")

-- Oil.nvim keymaps
require("oil").setup({})
keymap.set("n", "<C-e>", "<CMD>Oil --float<CR>", { desc = "Open parent directory" })

-- Diagnostics
keymap.set("n", "<C-J>", function()
  vim.diagnostic.goto_next()
end, opts)

keymap.set("n", "<leader>r", function()
  require("kaandesu.utils").replaceHexWithHSL()
end)
