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
local tex_utils = require("LuaSnip.helper-functions").tex_utils
return {
	s(
		{
			trig = "env",
			snippetType = "autosnippet",
			dscr = "An autotriggering snippet that starts a generic environment",
		},
		fmta(
			[[\begin{<>}
      <>
      \end{<>}]],
			{
				i(1, "environment name"),
				i(2),
				rep(1),
			}
		),
		{ condition = line_begin }
	),
	s(
		{ trig = "item", snippetType = "autosnippet", dscr = "An autotriggering snippet that starts an itemize list" },
		fmta(
			[[
        \begin{itemize}
          \item <>
        \end{itemize}
      ]],
			{
				i(1, "item"),
			}
		),
		{ condition = line_begin }
	),
	s(
		{ trig = "enum", snippetType = "autosnippet" },
		fmta(
			[[
        \begin{enumerate}
          \item <>
        \end{enumerate}
      ]],
			{
				i(1, "item"),
			}
		),
		{ condition = line_begin }
	),
	s(
		{ trig = "h1", snippetType = "autosnippet" },
		fmta(
			[[
        \section{<>}
      ]],
			{
				i(1, "sectionName"),
			}
		),
		{ condition = line_begin }
	),

	s(
		{ trig = "h2", snippetType = "autosnippet" },
		fmta(
			[[
        \subsection{<>}
      ]],
			{
				i(1, "sectionName"),
			}
		),
		{ condition = line_begin }
	),

	s(
		{ trig = "h3", snippetType = "autosnippet" },
		fmta(
			[[
        \subsubsection{<>}
      ]],
			{
				i(1, "sectionName"),
			}
		),
		{ condition = line_begin }
	),
	s(
		{ trig = "eq", snippetType = "autosnippet" },
		fmta(
			[[
        \begin{equation}
        <>
        \end{equation}
      ]],
			{
				i(1, "equation to enter"),
			}
		),
		{ condition = line_begin }
	),
	s(
		{ trig = "([^%a])mm", wordTrig = false, regTrig = true },
		fmta("<>$<>$", {
			f(function(_, snip)
				return snip.captures[1]
			end),
			d(1, tex_utils.get_visual),
		})
	),
}
