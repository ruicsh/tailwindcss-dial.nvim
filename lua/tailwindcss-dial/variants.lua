local M = {}

-- https://tailwindcss.com/docs/hover-focus-and-other-states#hover-focus-and-active
M.anchor = {
  "hover:",
  "focus:",
  "active:",
}

-- https://tailwindcss.com/docs/hover-focus-and-other-states#first-last-odd-and-even
M.order = {
  "first:",
  "last:",
  "odd:",
  "even:",
}

-- https://tailwindcss.com/docs/hover-focus-and-other-states#required-and-disabled
M.input = {
  "disabled:",
  "required:",
}

-- https://tailwindcss.com/docs/hover-focus-and-other-states#before-and-after
M.pseudo = {
  "before:",
  "after:",
}

-- https://tailwindcss.com/docs/responsive-design
M.breakpoints = {
  "sm:",
  "md:",
  "lg:",
  "xl:",
  "2xl:",
}

return M
