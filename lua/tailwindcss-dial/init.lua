local M = {}

local groups = require("tailwindcss-dial.groups")

--- @return table[]
function M.augends()
  local augend = require("dial.augend")

  local result = {}

  -- Colors
  for _, color in ipairs(groups.colors) do
    local color_group = {}
    for _, shade in ipairs(groups.shades) do
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
    for _, value in ipairs(groups.border_radius_values) do
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
    for _, mode in ipairs(groups.blend_modes) do
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

  -- Word rules
  local word_rules = {
    groups.align_items,
    groups.bg_linear,
    groups.bg_position,
    groups.bg_repeat,
    groups.bg_size,
    groups.box_shadow,
    groups.display,
    groups.flex_direction,
    groups.font_size,
    groups.font_stretch,
    groups.font_weight,
    groups.height,
    groups.justify_content,
    groups.line_height,
    groups.max_height,
    groups.max_width,
    groups.min_height,
    groups.min_width,
    groups.position,
    groups.text_align,
    groups.text_wrap,
    groups.tracking,
    groups.width,
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

  local non_word_rules = {
    groups.margin,
    groups.padding,
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
