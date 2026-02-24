local M = {}

local dims = {
  "auto",
  "full",
  "screen",
  "min",
  "max",
  "fit",
  "0",
  "px",
  "3xs",
  "2xs",
  "xs",
  "sm",
  "md",
  "lg",
  "xl",
  "2xl",
  "3xl",
  "4xl",
  "5xl",
  "6xl",
  "7xl",
  "dvw",
  "dvh",
  "lvw",
  "lvh",
  "svw",
  "svh",
}

M.width = {}
M.min_width = {}
M.max_width = {}
M.height = {}
M.min_height = {}
M.max_height = {}
M.inline = {}
M.min_inline = {}
M.max_inline = {}

for _, dim in ipairs(dims) do
  table.insert(M.width, "w-" .. dim)
  table.insert(M.height, "h-" .. dim)
  table.insert(M.min_width, "min-w-" .. dim)
  table.insert(M.max_width, "max-w-" .. dim)
  table.insert(M.min_height, "min-h-" .. dim)
  table.insert(M.max_height, "max-h-" .. dim)
  table.insert(M.inline, "inline-" .. dim)
  table.insert(M.min_inline, "min-inline-" .. dim)
  table.insert(M.max_inline, "max-inline-" .. dim)
end

local block_dims = {
  "auto",
  "px",
  "full",
  "screen",
  "min",
  "max",
  "fit",
  "dvw",
  "dvh",
  "lvw",
  "1vh",
  "dvw",
  "dvh",
  "svw",
  "svh",
}

M.block = {}
M.min_block = {}
M.max_block = {}

for _, dim in ipairs(block_dims) do
  table.insert(M.block, "block-" .. dim)
  table.insert(M.min_block, "min-block-" .. dim)
  table.insert(M.max_block, "max-block-" .. dim)
end

return M
