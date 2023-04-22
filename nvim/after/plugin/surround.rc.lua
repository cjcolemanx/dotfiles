local status, surround = pcall(require, "nvim-surround")
if not status then return end

local map = require("keymaps.plugin.surround")

surround.setup({
  keymaps = map.keys,
})

map.doc_keys()
