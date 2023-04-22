local M = {}

local utils = require("keymaps.util").utils("Mini", "Small Neovim Plugins")

if not utils then return end

local setKey = utils.setKey
local finishKeys = utils.finishKeys

M.keys = {
  align = {
    mappings = {
      start = 'ga',
      start_with_preview = 'gA'
    },
  }
}

return M
