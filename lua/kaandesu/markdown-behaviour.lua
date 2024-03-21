local M = {}

local myGroup = vim.api.nvim_create_augroup("MarkdownBehaviour", { clear = true })
function M.init()
  vim.api.nvim_create_autocmd({ "BufEnter", "BufWinEnter" }, {
    group = myGroup,
    pattern = "*.md",
    callback = function()
      vim.api.nvim_command("lua vim.diagnostic.hide()")
    end,
  })
  vim.api.nvim_create_autocmd({ "BufLeave", "BufWinLeave" }, {
    group = myGroup,
    pattern = "*.md",
    callback = function()
      vim.api.nvim_command("lua vim.diagnostic.show()")
    end,
  })
end
return M
