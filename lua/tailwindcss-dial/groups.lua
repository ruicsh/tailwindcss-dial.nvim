local M = {}

M.colors = {
	"amber",
	"blue",
	"cyan",
	"emerald",
	"fuchsia",
	"gray",
	"green",
	"indigo",
	"lime",
	"mauve",
	"mist",
	"neutral",
	"olive",
	"orange",
	"pink",
	"purple",
	"red",
	"rose",
	"sky",
	"slate",
	"stone",
	"taupe",
	"teal",
	"violet",
	"yellow",
	"zinc",
}

M.shades = { "100", "200", "300", "400", "500", "600", "700", "800", "900", "950" }

M.align_items = {
	"items-start",
	"items-end",
	"items-center",
	"items-baseline",
	"items-stretch",
}

M.bg_linear = {
	"bg-linear-to-t",
	"bg-linear-to-tr",
	"bg-linear-to-r",
	"bg-linear-to-br",
	"bg-linear-to-b",
	"bg-linear-to-bl",
	"bg-linear-to-l",
	"bg-linear-to-tl",
}

M.bg_position = {
	"bg-top-left",
	"bg-top",
	"bg-top-right",
	"bg-left",
	"bg-center",
	"bg-right",
	"bg-bottom-left",
	"bg-bottom",
	"bg-bottom-right",
}

M.bg_repeat = {
	"bg-repeat",
	"bg-repeat-x",
	"bg-repeat-y",
	"bg-repeat-space",
	"bg-repeat-round",
	"bg-no-repeat",
}

M.bg_size = {
	"bg-auto",
	"bg-cover",
	"bg-contain",
}

M.border_radius_values = {
	"none",
	"xs",
	"sm",
	"md",
	"lg",
	"xl",
	"2xl",
	"3xl",
	"4xl",
	"full",
}

M.box_shadow = {
	"shadow-none",
	"shadow-2xs",
	"shadow-xs",
	"shadow-sm",
	"shadow-md",
	"shadow-lg",
	"shadow-xl",
	"shadow-2xl",
}

M.display = {
	"block",
	"inline-block",
	"inline",
	"flex",
	"inline-flex",
	"grid",
	"inline-grid",
	"flow-root",
	"contents",
	"hidden",
}

M.flex_direction = {
	"flex-row",
	"flex-row-reverse",
	"flex-col",
	"flex-col-reverse",
}

M.font_size = {
	"text-xs",
	"text-sm",
	"text-base",
	"text-lg",
	"text-xl",
	"text-2xl",
	"text-3xl",
	"text-4xl",
	"text-5xl",
	"text-6xl",
	"text-7xl",
	"text-8xl",
	"text-9xl",
}

M.font_stretch = {
	"font-stretch-ultra-condensed",
	"font-stretch-extra-condensed",
	"font-stretch-condensed",
	"font-stretch-semi-condensed",
	"font-stretch-normal",
	"font-stretch-semi-expanded",
	"font-stretch-expanded",
	"font-stretch-extra-expanded",
	"font-stretch-ultra-expanded",
}

M.font_weight = {
	"font-thin",
	"font-extralight",
	"font-light",
	"font-normal",
	"font-medium",
	"font-semibold",
	"font-bold",
	"font-extrabold",
	"font-black",
}

M.justify_content = {
	"justify-start",
	"justify-end",
	"justify-center",
	"justify-between",
	"justify-around",
	"justify-evenly",
	"justify-stretch",
	"justify-baseline",
	"justify-normal",
}

M.line_height = {
	"leading-none",
	"leading-tight",
	"leading-snug",
	"leading-normal",
	"leading-relaxed",
	"leading-loose",
}

M.blend_modes = {
	"normal",
	"multiply",
	"screen",
	"overlay",
	"darken",
	"lighten",
	"color-dodge",
	"color-burn",
	"hard-light",
	"soft-light",
	"difference",
	"exclusion",
	"hue",
	"saturation",
	"color",
	"luminosity",
	"plus-lighter",
	"plus-darker",
}

M.position = { "static", "fixed", "absolute", "relative", "sticky" }

M.text_align = { "text-left", "text-center", "text-right", "text-justify", "text-start", "text-end" }

M.text_wrap = { "text-wrap", "text-nowrap", "text-balance", "text-pretty" }

M.tracking = {
	"tracking-tighter",
	"tracking-tight",
	"tracking-normal",
	"tracking-wide",
	"tracking-wider",
	"tracking-widest",
}

return M
