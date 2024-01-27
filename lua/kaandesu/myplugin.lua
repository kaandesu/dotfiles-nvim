local M = {}

function M.init()
  vim.on_key(function(key)
    print(key)
  end)
end

return M
