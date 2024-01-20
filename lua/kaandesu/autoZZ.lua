local M = {}
---@arg { limit: number, key: "j" | "k" | "<Up>" | "<Down>" }
function M.autoZZ(limit, key)
  local _limit = limit or 10
  local checkFor = { "j", "k", "<Up>", "<Down>" }
  local letterToCheck = key

  local found = false
  for _, letter in ipairs(myLetters) do
    if letter == letterToCheck then
      found = true
      break
    end
  end

  if found then
    return key .. "zz"
  else
    return key
  end
end

return M
