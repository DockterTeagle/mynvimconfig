local helpers = require "custom.LuaSnip.helper-functions"
return {
  helpers.s(
    { trig = "tii", dscr = "Expands 'tii' into LaTeX's textit{} command." },
    helpers.fmta("\\textit{<>}", {
      helpers.d(1, helpers.tex_utils.get_visual),
    })
  ),
}
