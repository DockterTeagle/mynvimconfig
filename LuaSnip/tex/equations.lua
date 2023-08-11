local helpers = require("custom.LuaSnip.helper-functions")
return {
  helpers.s({trig=";a",snippetType="autosnippet"},
    {
      helpers.t("\\alpha"),
    }
  ),
  helpers.s({trig=";b",snippetType="autosnippet"},
    {
      helpers.t("\\beta"),
    }
  ),
  helpers.s({trig=";g",snippetType="autosnippet"},
    {
      helpers.t("\\gamma"),
    }
  ),

}
