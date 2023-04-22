local go_status, go = pcall(require, "gomove")
local enabled = true

if not go_status then return end
if not enabled then return end

local maps = require("keymaps.plugin.gomove")
maps.binds()

go.setup({
  map_defaults = false,
  reindent = true,
  undojoin = true,
  move_past_end_col = true
})

maps.doc_keys()
