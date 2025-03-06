local ls = require("luasnip")
local s = ls.snippet
local sn = ls.snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local d = ls.dynamic_node
local fmta = require("luasnip.extras.fmt").fmta
local rep = require("luasnip.extras").rep
local line_begin = require("luasnip.extras.expand_conditions").line_begin
return {
	s(
		{ trig = ";art", snippetType = "snippet", dscr = "the article class from biblatex" },
		fmta(
			[[
        @article{ <>,
          author = {<>},
          journaltitle = {<>},
          title = {<>},
          volume = {<>},
          date = {<>},
        },
      ]],
			{
				i(1),
				i(2),
				i(3),
				i(4),
				i(5),
				i(6),
			}
		) --,
		-- { condition = line_begin }
	),
	s(
		{ trig = ";book", snippetType = "snippet", dscr = "The book class from biblatex" },
		fmta(
			[[
        @book{<>,
          author = {<>},
          title = {<>},
          date = {<>},
        },
      ]],
			{
				i(1),
				i(2),
				i(3),
				i(4),
			}
		)
		-- { condition = tex_utils.line_begin }
	),
}
