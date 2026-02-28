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

-- https://tailwindcss.com/docs/width
M.width = {}
-- https://tailwindcss.com/docs/min-width
M.min_width = {}
-- https://tailwindcss.com/docs/max-width
M.max_width = {}
-- https://tailwindcss.com/docs/height
M.height = {}
-- https://tailwindcss.com/docs/min-height
M.min_height = {}
-- https://tailwindcss.com/docs/max-height
M.max_height = {}
-- https://tailwindcss.com/docs/inline-size
M.inline_size = {}
-- https://tailwindcss.com/docs/min-inline-size
M.min_inline_size = {}
-- https://tailwindcss.com/docs/max-inline-size
M.max_inline_size = {}

for _, dim in ipairs(dims) do
  table.insert(M.width, "w-" .. dim)
  table.insert(M.height, "h-" .. dim)
  table.insert(M.min_width, "min-w-" .. dim)
  table.insert(M.max_width, "max-w-" .. dim)
  table.insert(M.min_height, "min-h-" .. dim)
  table.insert(M.max_height, "max-h-" .. dim)
  table.insert(M.inline_size, "inline-" .. dim)
  table.insert(M.min_inline_size, "min-inline-" .. dim)
  table.insert(M.max_inline_size, "max-inline-" .. dim)
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
  "lvh",
  "svw",
  "svh",
}

-- https://tailwindcss.com/docs/block-size
M.block_size = {}
-- https://tailwindcss.com/docs/min-block-size
M.min_block_size = {}
-- https://tailwindcss.com/docs/max-block-size
M.max_block_size = {}

for _, dim in ipairs(block_dims) do
  table.insert(M.block_size, "block-" .. dim)
  table.insert(M.min_block_size, "min-block-" .. dim)
  table.insert(M.max_block_size, "max-block-" .. dim)
end

return M
