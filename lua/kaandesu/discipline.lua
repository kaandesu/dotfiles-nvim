local M = {}

function M.init()
  ---@type table?
  local id
  local ok = true
  local limit = 15
  for _, key in ipairs({ "h", "j", "k", "l", "+", "-", "<Left>", "<Right>", "<Up>", "<Down>" }) do
    local count = 0
    local timer = assert(vim.loop.new_timer())
    local map = key
    vim.keymap.set("n", key, function()
      if vim.v.count > 0 then
        count = 0
      end
      if count >= limit then
        ok, id = pcall(vim.notify, "Hold it Cowboy!", vim.log.levels.WARN, {
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
        timer:start(2000, 0, function()
          count = 0
        end)
        local newKey = M.autoZZ(10, key)
        return newKey
      end
    end, { expr = true, silent = true })
  end
end

---@arg { limit: number, key: "j" | "k" | "<Up>" | "<Down>" }
---@return string
function M.autoZZ(limit, key)
  local _limit = limit or 10
  local checkFor = { "j", "k", "<Up>", "<Down>" }
  local letterToCheck = key

  local found = false
  for _, letter in ipairs(checkFor) do
    if letter == letterToCheck then
      found = true
      break
    end
  end

  if found and vim.v.count > _limit then
    return key .. "zz"
  else
    return key
  end
end

return M
