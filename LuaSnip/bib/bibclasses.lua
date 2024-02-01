local helpers = require "custom.LuaSnip.helper-functions"
return {
  helpers.s(
    { trig = ";article", snippetType = "snippet", dscr = "the article class from biblatex" },
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
    ),
    { condition = helpers.line_begin }
  ),
  helpers.s(
    { trig = ";book", snippetType = "snippet", dscr = "The book class from biblatex" },
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
    ),
    { condition = helpers.tex_utils.line_begin }
  ),
}
