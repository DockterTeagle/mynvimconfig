local helpers = require("LuaSnip.helper-functions")
return {
	helpers.s(
		{ trig = ";main", snippetType = "autosnippet", descr = "make main function" },
		helpers.fmta(
			[[
        if __name__ =="__main__":
          <>
      ]],
			{ helpers.i(1, "rest of the code") }
		),
		{ condition = helpers.line_begin }
	),
}
