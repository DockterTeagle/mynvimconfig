local ls = require("luasnip")
local s = ls.snippet
local d = ls.dynamic_node
local fmta = require("luasnip.extras.fmt").fmta
local tex_utils = require("snippets.LuaSnip.helper-functions").tex_utils
return {
	s(
		{ trig = "tii", dscr = "Expands 'tii' into LaTeX's textit{} command.", snippetType = "autosnippet" },
		fmta("\\textit{<>}", {
			d(1, tex_utils.get_visual),
		})
	),
}
