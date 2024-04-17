local helpers = require("LuaSnip.helper-functions")
return {
	helpers.s(
		{ trig = ";art", snippetType = "snippet", dscr = "the article class from biblatex" },
		helpers.fmta(
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
				helpers.i(1),
				helpers.i(2),
				helpers.i(3),
				helpers.i(4),
				helpers.i(5),
				helpers.i(6),
			}
		) --,
		-- { condition = helpers.line_begin }
	),
	helpers.s(
		{ trig = ";boook", snippetType = "snippet", dscr = "The book class from biblatex" },
		helpers.fmta(
			[[
        @book{<>,
          author = {<>},
          title = {<>},
          date = {<>},
        },
      ]],
			{
				helpers.i(1),
				helpers.i(2),
				helpers.i(3),
				helpers.i(4),
			}
		)
		-- { condition = helpers.tex_utils.line_begin }
	),
}
