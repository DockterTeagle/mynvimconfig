local helpers = require "custom.LuaSnip.helper-functions"
return {
  helpers.s({ trig = "main", snippetType = "snippet" }, {
    helpers.t 'if __name__ == "main":',
  }, { condition = helpers.line_begin }),
}
