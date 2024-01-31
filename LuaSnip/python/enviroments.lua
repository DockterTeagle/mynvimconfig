local helpers = require "custom.LuaSnip.helper-functions"
return {
  helpers.s({ trig = "main", snippetType = "snippet" }, {
    helpers.t 'if __name__ == "__main__":',
  }, { condition = helpers.line_begin }),
}
