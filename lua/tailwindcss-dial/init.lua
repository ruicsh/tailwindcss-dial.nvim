local M = {}

local backgrounds = require("tailwindcss-dial.backgrounds")
local borders = require("tailwindcss-dial.borders")
local colors = require("tailwindcss-dial.colors")
local effects = require("tailwindcss-dial.effects")
local flexbox_grid = require("tailwindcss-dial.flexbox-grid")
local layout = require("tailwindcss-dial.layout")
local sizing = require("tailwindcss-dial.sizing")
local spacing = require("tailwindcss-dial.spacing")
local typography = require("tailwindcss-dial.typography")

--- @return table[]
function M.augends()
  local augend = require("dial.augend")

  local result = {}

  -- Colors
  for _, color in ipairs(colors.names) do
    local color_group = {}
    for _, shade in ipairs(colors.shades) do
      table.insert(color_group, color .. "-" .. shade)
    end
    table.insert(
      result,
      augend.constant.new({
        elements = color_group,
        word = false,
        cyclic = true,
      })
    )
  end

  -- Border Radius
  local border_radius_prefixes = {
    "",
    "t-",
    "b-",
    "l-",
    "r-",
    "tl-",
    "tr-",
    "bl-",
    "br-",
  }

  for _, prefix in ipairs(border_radius_prefixes) do
    local group = {}
    for _, value in ipairs(borders.border_radius_values) do
      table.insert(group, "rounded-" .. prefix .. value)
    end
    table.insert(
      result,
      augend.constant.new({
        elements = group,
        word = true,
        cyclic = true,
      })
    )
  end

  -- Blend Modes
  local blend_prefixes = { "mix-blend-", "bg-blend-" }
  for _, prefix in ipairs(blend_prefixes) do
    local group = {}
    for _, mode in ipairs(effects.blend_modes) do
      table.insert(group, prefix .. mode)
    end
    table.insert(
      result,
      augend.constant.new({
        elements = group,
        word = true,
        cyclic = true,
      })
    )
  end

  -- Full word rules
  local word_rules = {
    backgrounds.bg_linear,
    backgrounds.bg_position,
    backgrounds.bg_repeat,
    backgrounds.bg_size,

    effects.box_shadow,

    flexbox_grid.align_items,
    flexbox_grid.flex_direction,
    flexbox_grid.justify_content,

    layout.display,
    layout.position,

    sizing.block,
    sizing.height,
    sizing.inline,
    sizing.max_block,
    sizing.max_height,
    sizing.max_inline,
    sizing.max_width,
    sizing.min_block,
    sizing.min_height,
    sizing.min_inline,
    sizing.min_width,
    sizing.width,

    typography.font_size,
    typography.font_stretch,
    typography.font_weight,
    typography.line_height,
    typography.text_align,
    typography.text_wrap,
    typography.tracking,
  }

  for _, group in ipairs(word_rules) do
    table.insert(
      result,
      augend.constant.new({
        elements = group,
        word = true,
        cyclic = true,
      })
    )
  end

  -- Partial word rules (e.g., margin, padding)
  local non_word_rules = {
    spacing.margin,
    spacing.padding,
  }

  for _, group in ipairs(non_word_rules) do
    table.insert(
      result,
      augend.constant.new({
        elements = group,
        word = false,
        cyclic = true,
      })
    )
  end

  return result
end

local configured_groups = {}

--- @param opts? { group: string }
function M.setup(opts)
  local group_name = (opts and opts.group) or "default"
  if configured_groups[group_name] then
    return
  end

  local status, dial_config = pcall(require, "dial.config")
  if not status or not dial_config.augends then
    return
  end

  local new_augends = M.augends()

  -- dial.nvim stores groups in `augends.group` (singular), but some versions might use `groups`
  local group_table = dial_config.augends.group or dial_config.augends.groups
  if not group_table then
    -- Fallback to calling register_group directly if we can't find the table
    dial_config.augends:register_group({
      [group_name] = new_augends,
    })
    configured_groups[group_name] = true
    return
  end

  local target_group = group_table[group_name]

  -- If the group doesn't exist, we start with an empty table.
  if not target_group or type(target_group) ~= "table" then
    target_group = {}
  end

  -- We create a new table to avoid modifying the existing one in place if it's used elsewhere,
  -- We'll just append to a new list that starts with the existing ones.
  local final_group = {}
  for _, a in ipairs(target_group) do
    table.insert(final_group, a)
  end
  for _, a in ipairs(new_augends) do
    table.insert(final_group, a)
  end

  dial_config.augends:register_group({
    [group_name] = final_group,
  })

  configured_groups[group_name] = true
end

return M
