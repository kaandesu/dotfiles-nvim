local M = {}

function M.init()
  ---@type table?
  local pid
  local ok = true
  local keys = { "h", "j", "k", "l" }
  local limit = 10
  for _, key in ipairs(keys) do
    local map = key
    local count = 0
    local timer = assert(vim.loop.new_timer())

    vim.keymap.set("n", key, function()
      if vim.v.count >= limit then
        count = 0
      end

      if count >= limit then
        ok, pid = pcall(vim.notify, "Slowdown duuuude!", vim.log.levels.WARN, {
          icon = "😘",
          replace = pid,
          keep = function()
            return count >= limit
          end,
        })
        if not ok then
          pid = nil
          return map
        end
      else
        count = count + 1
        timer:start(2000, 0, function()
          count = 0
        end)
      end
    end, { expr = true, silent = true })
  end
end

return M
