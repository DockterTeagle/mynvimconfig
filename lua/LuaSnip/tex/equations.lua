local helpers = require("LuaSnip.helper-functions")
return {
	helpers.s({ trig = ";a", snippetType = "autosnippet" }, {
		helpers.t("\\alpha"),
	}, { condition = helpers.tex_utils.in_mathzone }),
	helpers.s({ trig = ";b", snippetType = "autosnippet" }, {
		helpers.t("\\beta"),
	}, { condition = helpers.tex_utils.in_mathzone }),
	helpers.s({ trig = ";g", snippetType = "autosnippet" }, {
		helpers.t("\\gamma"),
	}, { condition = helpers.tex_utils.in_mathzone }),
	helpers.s({ trig = ";m", snippetType = "autosnippet" }, {
		helpers.t("\\mu"),
	}, { condition = helpers.tex_utils.in_mathzone }),
	helpers.s(
		{ trig = "ff" },
		helpers.fmta("\\frac{<>}{<>}", {
			helpers.i(1),
			helpers.i(2),
		}),
		{ condition = helpers.tex_utils.in_mathzone } -- `condition` option passed in the snippet `opts` table
	),
}
