local helpers = require("LuaSnip.helper-functions")
return {
	helpers.s({ trig = "main" }, {
		helpers.t('if __name__ == "__main__":'),
	}, { condition = helpers.line_begin }),
}
