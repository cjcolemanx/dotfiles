local status, comment = pcall(require, "Comment")
if not status then return end

local keymap = require('keymaps.plugin.comment')
local keys = keymap.keymap
keymap.binds()

local config = {
  padding = true, -- space after comment symbol
  sticky = true,  -- cursor stays in position
  toggler = keys.toggler,
  opleader = keys.opleader,
  extra = keys.extra,
}

comment.setup(config)
keymap.doc_keys()
