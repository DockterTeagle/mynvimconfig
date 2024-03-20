return {
  {
    "L3MON4D3/LuaSnip",
    build = "make install_jsregexp",
    dependencies = {},
    init = function()
      local ls = require "luasnip"
      ls.config.set_config { --not the most elegant can probably make this a config part instead
        history = true,
        enable_autosnippets = true,
        update_events = "TextChanged,TextChangedI",
        store_selection_keys = "<Tab>",
      }
    end,
  },
}
