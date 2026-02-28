local M = {}

local cached_augends = nil

local accessibility = require("tailwindcss-dial.accessibility")
local backgrounds = require("tailwindcss-dial.backgrounds")
local borders = require("tailwindcss-dial.borders")
local colors = require("tailwindcss-dial.colors")
local effects = require("tailwindcss-dial.effects")
local filters = require("tailwindcss-dial.filters")
local flexbox_grid = require("tailwindcss-dial.flexbox-grid")
local interactivity = require("tailwindcss-dial.interactivity")
local layout = require("tailwindcss-dial.layout")
local sizing = require("tailwindcss-dial.sizing")
local spacing = require("tailwindcss-dial.spacing")
local svg = require("tailwindcss-dial.svg")
local tables = require("tailwindcss-dial.tables")
local transforms = require("tailwindcss-dial.transforms")
local transitions_animation = require("tailwindcss-dial.transitions-animation")
local typography = require("tailwindcss-dial.typography")
local variants = require("tailwindcss-dial.variants")

--- @return table[]
function M.augends()
  if cached_augends then
    return cached_augends
  end

  local augend = require("dial.augend")

  local result = {}

  -- Full word rules
  local word_rules = {
    accessibility.forced_color_adjust,

    backgrounds.bg_attachment,
    backgrounds.bg_clip,
    backgrounds.bg_image,
    backgrounds.bg_origin,
    backgrounds.bg_position,
    backgrounds.bg_repeat,
    backgrounds.bg_size,

    borders.border_radius,
    borders.border_radius_t,
    borders.border_radius_b,
    borders.border_radius_l,
    borders.border_radius_r,
    borders.border_radius_tl,
    borders.border_radius_tr,
    borders.border_radius_bl,
    borders.border_radius_br,
    borders.border_style,
    borders.divide_style,
    borders.outline_style,

    effects.box_shadow,
    effects.text_shadow,
    effects.mix_blend_mode,
    effects.bg_blend_mode,
    effects.mask_clip,
    effects.mask_composite,
    effects.mask_mode,
    effects.mask_origin,
    effects.mask_position,
    effects.mask_repeat,
    effects.mask_size,
    effects.mask_type,

    filters.blur,
    filters.drop_shadow,
    filters.backdrop_blur,

    flexbox_grid.align_content,
    flexbox_grid.align_items,
    flexbox_grid.align_self,
    flexbox_grid.flex_basis,
    flexbox_grid.flex_direction,
    flexbox_grid.flex_wrap,
    flexbox_grid.grid_auto_columns,
    flexbox_grid.grid_auto_flow,
    flexbox_grid.grid_auto_rows,
    flexbox_grid.justify_content,
    flexbox_grid.justify_items,
    flexbox_grid.justify_self,
    flexbox_grid.place_content,
    flexbox_grid.place_items,
    flexbox_grid.place_self,

    interactivity.appearance,
    interactivity.color_scheme,
    interactivity.cursor,
    interactivity.field_sizing,
    interactivity.pointer_events,
    interactivity.resize,
    interactivity.scroll_behavior,
    interactivity.scroll_snap_align,
    interactivity.scroll_snap_stop,
    interactivity.scroll_snap_type,
    interactivity.touch_action,
    interactivity.user_select,
    interactivity.will_change,

    layout.aspect_ratio,
    layout.box_decoration_break,
    layout.box_sizing,
    layout.break_after,
    layout.break_before,
    layout.break_inside,
    layout.clear,
    layout.columns,
    layout.display,
    layout.float,
    layout.isolation,
    layout.object_fit,
    layout.object_position,
    layout.overflow,
    layout.overscroll_behavior,
    layout.position,
    layout.visibility,

    sizing.block_size,
    sizing.max_block_size,
    sizing.min_block_size,
    sizing.height,
    sizing.max_height,
    sizing.min_height,
    sizing.inline_size,
    sizing.min_inline_size,
    sizing.max_inline_size,
    sizing.width,
    sizing.min_width,
    sizing.max_width,

    tables.border_collapse,
    tables.table_layout,
    tables.caption_side,

    transforms.backface_visibility,
    transforms.perspective,
    transforms.perspective_origin,
    transforms.transform,
    transforms.transform_origin,
    transforms.transform_style,

    transitions_animation.transition_property,
    transitions_animation.transition_behavior,
    transitions_animation.transition_timing_function,
    transitions_animation.animation,

    typography.font_family,
    typography.font_size,
    typography.font_smoothing,
    typography.font_stretch,
    typography.font_style,
    typography.font_variant_numeric,
    typography.font_weight,
    typography.hyphens,
    typography.letter_spacing,
    typography.line_height,
    typography.list_style_position,
    typography.list_style_type,
    typography.overflow_wrap,
    typography.text_align,
    typography.text_decoration_line,
    typography.text_decoration_style,
    typography.text_overflow,
    typography.text_transform,
    typography.text_wrap,
    typography.vertical_align,
    typography.white_space,
    typography.word_break,
  }

  for _, color_name in ipairs(colors.names) do
    table.insert(word_rules, backgrounds["bg_color_" .. color_name])
    table.insert(word_rules, borders["border_color_" .. color_name])
    table.insert(word_rules, borders["outline_color_" .. color_name])
    table.insert(word_rules, effects["box_shadow_color_" .. color_name])
    table.insert(word_rules, effects["text_shadow_color_" .. color_name])
    table.insert(word_rules, interactivity["accent_color_" .. color_name])
    table.insert(word_rules, interactivity["caret_color_" .. color_name])
    table.insert(word_rules, svg["fill_color_" .. color_name])
    table.insert(word_rules, svg["stroke_color_" .. color_name])
    table.insert(word_rules, typography["color_" .. color_name])
    table.insert(word_rules, typography["decoration_" .. color_name])
  end

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
    borders.border_width,

    flexbox_grid.col_span,
    flexbox_grid.gap,
    flexbox_grid.row_span,

    interactivity.scroll_margin,
    interactivity.scroll_padding,

    layout.inset,
    layout.sides,

    spacing.margin,
    spacing.padding,

    tables.border_spacing,

    transforms.rotate,
    transforms.scale,
    transforms.skew,
    transforms.translate,

    variants.anchor,
    variants.order,
    variants.input,
    variants.pseudo,
    variants.breakpoints,
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

  cached_augends = result
  return result
end

local configured_groups = {}
local configured_filetypes = {}

local function merge_augends(existing, new)
  local final = {}
  if type(existing) == "table" then
    for _, a in ipairs(existing) do
      table.insert(final, a)
    end
  end
  for _, a in ipairs(new) do
    table.insert(final, a)
  end
  return final
end

local function normalize_filetypes(opts)
  if not opts then
    return {}
  end

  local filetypes = opts.filetype or opts.ft
  if not filetypes then
    return {}
  end

  if type(filetypes) == "string" then
    return { filetypes }
  end

  if type(filetypes) == "table" then
    local list = {}
    for _, value in ipairs(filetypes) do
      if type(value) == "string" and value ~= "" then
        table.insert(list, value)
      end
    end
    return list
  end

  return {}
end

--- @param opts? { group: string, filetype?: string|string[], ft?: string[] }
function M.setup(opts)
  local group_name = (opts and opts.group) or "default"

  local status, dial_config = pcall(require, "dial.config")
  if not status or not dial_config.augends then
    return
  end

  local new_augends = M.augends()

  local filetypes = normalize_filetypes(opts)

  if #filetypes == 0 and not configured_groups[group_name] then
    -- dial.nvim stores groups in `augends.group` (singular), but some versions might use `groups`
    local group_table = dial_config.augends.group or dial_config.augends.groups
    if not group_table then
      -- Fallback to calling register_group directly if we can't find the table
      dial_config.augends:register_group({
        [group_name] = new_augends,
      })
      configured_groups[group_name] = true
    else
      local target_group = group_table[group_name]

      -- If the group doesn't exist, we start with an empty table.
      if not target_group or type(target_group) ~= "table" then
        target_group = {}
      end

      dial_config.augends:register_group({
        [group_name] = merge_augends(target_group, new_augends),
      })

      configured_groups[group_name] = true
    end
  end

  if (opts and opts.group) or #filetypes == 0 then
    return
  end

  local filetype_table = dial_config.augends.filetype
  for _, filetype in ipairs(filetypes) do
    if not configured_filetypes[filetype] then
      local existing = filetype_table and filetype_table[filetype]
      local final = merge_augends(existing, new_augends)
      if dial_config.augends.on_filetype then
        dial_config.augends:on_filetype({
          [filetype] = final,
        })
      elseif filetype_table then
        filetype_table[filetype] = final
      end
      configured_filetypes[filetype] = true
    end
  end
end

return M
