local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

local fmt = require("luasnip.extras.fmt").fmt

return {
  -- s("trig", t("loaded!!")),
  -- s("#!/usr/bin/env", fmt("#!/usr/bin/env {}\n#\n# {}", {i(1, 'sh'), i(2)}))
}
