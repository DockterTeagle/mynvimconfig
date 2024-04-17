local helpers = require("LuaSnip.helper-functions")
return {
	helpers.s(
		{
			trig = "env",
			snippetType = "autosnippet",
			dscr = "An autotriggering snippet that starts a generic enviroment",
		},
		helpers.fmta(
			[[\begin{<>}
      <>
      \end{<>}]],
			{
				helpers.i(1, "enviroment name"),
				helpers.i(2),
				helpers.rep(1),
			}
		),
		{ condition = helpers.line_begin }
	),
	helpers.s(
		{ trig = "item", snippetType = "autosnippet", dscr = "An autotriggering snippet that starts an itemize list" },
		helpers.fmta(
			[[
        \begin{itemize}
          \item <>
        \end{itemize}
      ]],
			{
				helpers.i(1, "item"),
			}
		),
		{ condition = helpers.line_begin }
	),
	helpers.s(
		{ trig = "enum", snippetType = "autosnippet" },
		helpers.fmta(
			[[
        \begin{enumerate}
          \item <>
        \end{enumerate}
      ]],
			{
				helpers.i(1, "item"),
			}
		),
		{ condition = helpers.line_begin }
	),
	helpers.s(
		{ trig = "h1", snippetType = "autosnippet" },
		helpers.fmta(
			[[
        \section{<>}
      ]],
			{
				helpers.i(1, "sectionName"),
			}
		),
		{ condition = helpers.line_begin }
	),

	helpers.s(
		{ trig = "h2", snippetType = "autosnippet" },
		helpers.fmta(
			[[
        \subsection{<>}
      ]],
			{
				helpers.i(1, "sectionName"),
			}
		),
		{ condition = helpers.line_begin }
	),

	helpers.s(
		{ trig = "h3", snippetType = "autosnippet" },
		helpers.fmta(
			[[
        \subsubsection{<>}
      ]],
			{
				helpers.i(1, "sectionName"),
			}
		),
		{ condition = helpers.line_begin }
	),
	helpers.s(
		{ trig = "eq", snippetType = "autosnippet" },
		helpers.fmta(
			[[
        \begin{equation}
        <>
        \end{equation}
      ]],
			{
				helpers.i(1, "equation to enter"),
			}
		),
		{ condition = helpers.line_begin }
	),
}
