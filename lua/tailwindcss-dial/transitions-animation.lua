local M = {}

-- https://tailwindcss.com/docs/transition-property
M.transition_property = {
  "transition",
  "transition-all",
  "transition-colors",
  "transition-opacity",
  "transition-shadow",
  "transition-transform",
  "transition-none",
}

-- https://tailwindcss.com/docs/transition-behavior
M.transition_behavior = {
  "transition-normal",
  "transition-discrete",
}

-- https://tailwindcss.com/docs/transition-timing-function
M.transition_timing_function = {
  "ease-linear",
  "ease-in",
  "ease-out",
  "ease-in-out",
  "ease-initial",
}

-- https://tailwindcss.com/docs/animation
M.animation = {
  "animate-none",
  "animate-spin",
  "animate-ping",
  "animate-pulse",
  "animate-bounce",
}

return M
