local M = {}

M.padding = { "p-" }
M.margin = { "m-" }

local directions = { "x", "y", "t", "r", "b", "l", "s", "e", "bs", "be" }
for _, direction in ipairs(directions) do
  table.insert(M.padding, "p" .. direction .. "-")
  table.insert(M.margin, "m" .. direction .. "-")
end

return M
