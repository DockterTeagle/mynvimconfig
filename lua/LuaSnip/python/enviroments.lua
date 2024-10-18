local helpers = require("LuaSnip.helper-functions")
return {
	helpers.s({ trig = "main", snippetType = "autosnippet" }, {
		helpers.t('if __name__ == "__main__":'),
	}, { condition = helpers.line_begin }),
}
