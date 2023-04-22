local M = {}

local utils = require("keymaps.util").utils("Legendary", "Keymap Viewer (this)")

local setKey = utils.setKey
local finishKeys = utils.finishKeys

function M.binds()
  local _funcs = require("functions.plugins.legendary").init()

  setKey(";xk", ":Legendary keys<CR>", nil, nil, "Legendary Keymaps")
  setKey(";xf", ":Legendary functions<CR>", nil, nil, "Legendary Functions")
  setKey(";xc", ":Legendary commands<CR>", nil, nil, "Legendary Commands")
  setKey(";x/", _funcs.get_functions_as_table, nil, nil, "Legendary Commands")
  -- setKey(";x/", _funcs.find_undocumented_keys, nil, nil, "Find Undocumented Keys")

  finishKeys()
end

return M
