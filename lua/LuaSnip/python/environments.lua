local ls = require("luasnip")
local s = ls.snippet
local sn = ls.snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local d = ls.dynamic_node
local fmt = require("luasnip.extras.fmt").fmt
local fmta = require("luasnip.extras.fmt").fmta
local rep = require("luasnip.extras").rep
local line_begin = require("luasnip.extras.expand_conditions").line_begin
return {
	s(
		{ trig = ";main", snippetType = "autosnippet", descr = "make main function" },
		fmta(
			[[
        if __name__ =="__main__":
          <>
      ]],
			{ i(1, "rest of the code") }
		),
		{ condition = line_begin }
	),
}
