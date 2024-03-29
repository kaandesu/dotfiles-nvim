local M = {}

function M.init()
  local count = 0
  local timer = assert(vim.loop.new_timer())

  vim.keymap.set("n", "<C-c>", function()
    count = count + 1
    if count == 2 then
      count = 0
      return ":qa<Cr>"
    end
    timer:start(150, 0, function()
      count = 0
    end)
  end, { expr = true, silent = true })
end

return M
