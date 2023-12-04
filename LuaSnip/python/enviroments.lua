local helpers = require "custom.LuaSnip.helper-functions"
return {
  helpers.s({ trig = "main", snippetType = "autosnippet" }, {
    helpers.t 'if __name__ == "main"',
  }, { condition = helpers.line_begin }),
}
