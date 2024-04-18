-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

-- Turn of paste mode when leaving insert
vim.api.nvim_create_autocmd("InsertLeave", {
  pattern = "*",
  command = "set nopaste",
})

-- Fix conceallevel for json files
vim.api.nvim_create_autocmd("BufEnter", {
  pattern = "*",
  callback = function()
    require("neo-tree.command").execute({ action = "close" })
  end,
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = { "json", "jsonc", "md", "markdown" },
  callback = function()
    vim.wo.spell = false
    vim.wo.conceallevel = 0
  end,
})

-- local client = vim.lsp.start_client({
--   name = "kaanlsp",
--   cmd = { "/Users/kaanyilmaz/Desktop/Programming/gits/LSP/main" },
--   filetypes = { "markdown" },
-- })
-- if not client then
--   vim.notify("there is something wrong with the client")
-- end
-- vim.api.nvim_create_autocmd("FileType", {
--   pattern = { "md", "markdown" },
--   callback = function()
--     if not client then
--       vim.notify("there is something wrong with the client")
--       return
--     end
--     vim.lsp.buf_attach_client(0, client)
--   end,
-- })
