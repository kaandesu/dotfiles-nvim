local M = {}

local myGroup = vim.api.nvim_create_augroup("CustomHandled", { clear = true })
function M.init()
  vim.api.nvim_create_autocmd("BufWritePost", {
    group = myGroup,
    pattern = "*",
    callback = function()
      return "[[%s/s+//e]]"
    end,
  })

  vim.keymap.set("i", " ", " ")
end
return M
