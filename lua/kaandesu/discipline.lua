local M = {}
local totalJumps = 0
function M.init()
  ---@type table?
  local id
  local ok = true
  local limit = 20
  for _, key in ipairs({ "h", "j", "k", "l", "+", "-", "<Left>", "<Right>", "<Up>", "<Down>" }) do
    local count = 0
    local timer = assert(vim.loop.new_timer())
    local map = key
    local newKey = ""
    vim.keymap.set("n", key, function()
      if vim.v.count > 0 then
        count = 0
      end
      if count >= limit then
        ok, id = pcall(vim.notify, "Slowdown dude!", vim.log.levels.WARN, {
          icon = "🤠",
          replace = id,
          keep = function()
            return count >= limit
          end,
        })
        if not ok then
          id = nil
          return map
        end
      else
        count = count + 1
        timer:start(1000, 0, function()
          count = 0
        end)
        newKey = M.autoZZ(10, key, count)
        return newKey
      end
    end, { expr = true, silent = true })
  end
end

local jumpTimer = assert(vim.loop.new_timer())
---@param  limit number
---@param key string
---@return string newKey
function M.autoZZ(limit, key, _count)
  local jumpAfterBy = { 5, 3 }
  local _limit = limit or 10
  local checkFor = { "j", "k", "<Up>", "<Down>" }
  local letterToCheck = key
  ---@return number totalJump
  local found = false
  for _, letter in ipairs(checkFor) do
    if letter == letterToCheck then
      found = true
      break
    end
  end
  if not found then
    return key
  end
  jumpTimer:stop()
  jumpTimer:start(750, 0, function()
    totalJumps = 0
  end)
  ---@type number
  totalJumps = totalJumps + vim.v.count
  if vim.v.count >= _limit or totalJumps >= 20 then
    return key .. "zz"
  else
    if _count >= jumpAfterBy[1] then
      totalJumps = totalJumps + jumpAfterBy[2]
      if totalJumps >= 15 then
        return jumpAfterBy[2] .. key .. "zz"
      end
      return jumpAfterBy[2] .. key
    else
      totalJumps = totalJumps + 1
      if totalJumps >= 15 then
        return key .. "zz"
      end
      return key
    end
  end
end

return M
