# tailwindcss-dial.nvim

A Neovim plugin that extends [dial.nvim](https://github.com/monaqa/dial.nvim) to toggle TailwindCSS classes.

<img src="assets/screenshot.gif" />

## Features

- Toggle between TailwindCSS color shades (e.g., `blue-100` -> `blue-200`).
- Toggle between TailwindCSS utility classes (e.g., `flex-row` -> `flex-col`).
- Supported categories:
  - Colors
  - Border Radius
  - Blend Modes
  - Align Items
  - Background (linear, position, repeat, size)
  - Box Shadow
  - Display
  - Flex Direction
  - Font (size, stretch, weight)
  - Justify Content
  - Line Height
  - Position
  - Text (align, wrap)
  - Letter Spacing (tracking)

## Installation

Using [lazy.nvim](https://github.com/folke/lazy.nvim):

### Option 1: Automatic setup

This is the recommended method. It will automatically detect your existing `dial.nvim` configuration and **augment** your `default` group (or any other group you specify) with TailwindCSS augends.

```lua
{
  "ruicsh/tailwindcss-dial.nvim",
  dependencies = { "monaqa/dial.nvim" },
  opts = {
    -- group = "default", -- optional, defaults to "default"
    -- filetype = { "typescript", "tsx" }, -- optional
  },
}
```

By using `dependencies`, `lazy.nvim` ensures that `dial.nvim` is loaded and your custom `dial` groups are already registered before `tailwindcss-dial.nvim` runs its setup. This allows it to safely merge with your existing configuration.

Notes:
- If you configure `filetype`, the plugin will not modify the default group.
- If you configure `group`, the plugin will not register filetype augends.

### Option 2: Manual setup

If you want more control, you can manually add the augends to your configuration using the `augends()` function:

```lua
{
  "ruicsh/tailwindcss-dial.nvim",
  dependencies = { "monaqa/dial.nvim" },
  config = function()
    local dial_config = require("dial.config")
    local tailwindcss_dial = require("tailwindcss-dial")

    dial_config.augends:register_group({
      default = {
        -- ... your other augends
        table.unpack(tailwindcss_dial.augends()),
      },
    })
  end,
}
```

## Documentation

For more details, see `:help tailwindcss-dial`.
