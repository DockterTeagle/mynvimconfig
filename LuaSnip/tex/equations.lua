local helpers = require("custom.LuaSnip.helper-functions")
return {
  helpers.s({trig=";a",snippetType="autosnippet"},
    {
      helpers.t("\\alpha"),
    },
    {condition = helpers.tex_utils.in_mathzone}
  ),
  helpers.s({trig=";b",snippetType="autosnippet"},
    {
      helpers.t("\\beta"),
    },
    {condition = helpers.tex_utils.in_mathzone}
  ),
  helpers.s({trig=";g",snippetType="autosnippet"},
    {
      helpers.t("\\gamma"),
    },
    {condition = helpers.tex_utils.in_mathzone}
  ),
  helpers.s({trig=";m",snippetType="autosnippet"},
    {
      helpers.t("\\mu"),
    },
    {condition=helpers.tex_utils.in_mathzone}
  ),
}
