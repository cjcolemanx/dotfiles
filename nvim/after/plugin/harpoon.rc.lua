local status, harpoon = pcall(require, "harpoon")

if not status then
  return
end

harpoon.setup()

local mark = require("harpoon.mark")
-- local ui = require("harpoon.ui")
local maps = require("keymaps.plugin.harpoon")
maps.binds(mark --[[ , ui ]])
maps.doc_keys()
